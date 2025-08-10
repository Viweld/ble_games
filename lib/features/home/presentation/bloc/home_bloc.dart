import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dep_gen/dep_gen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/models/device.dart';
import '../../../../core/domain/models/messages.dart';
import '../../../../core/domain/models/user.dart';
import '../../../../core/repositories/i_user_repository.dart';
import '../../../../core/repositories/i_bluetooth_repository.dart';
import '../../../game/domain/models/enums/player_type.dart';

part 'events.dart';

part 'states.dart';

part 'home_bloc.freezed.dart';

/// BLoC для главного экрана
@DepGen()
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    @DepArg() required IUserRepository playerRepository,
    @DepArg() required IBluetoothRepository bluetoothRepository,
  }) : _playerRepository = playerRepository,
       _bluetoothRepository = bluetoothRepository,
       super(const HomeState.initializationPending()) {
    on<HomeEvent>(
      (event, emitter) => switch (event) {
        HomeEventOnInitializationRequested() => _onInitializationRequested(
          emitter,
        ),
        HomeEventOnRefreshRequested() => _onRefreshRequested(emitter),
        HomeEventOnDeviceSelected() => _onDeviceSelected(event, emitter),
        HomeEventOnInvite() => _onInvite(emitter),
        HomeEventOnCancelInvitation() => _onCancelInvitation(emitter),
        HomeEventOnAcceptInvitation() => _onAcceptInvitation(emitter),
        HomeEventOnRejectInvitation() => _onRejectInvitation(emitter),
        HomeEventOnNicknameSaved() => _onNicknameSaved(event, emitter),
        HomeEventOnViewStateChanged() => _onViewStateChanged(emitter),
        HomeEventOnInvitationReceived() => _onInvitationReceived(
          event,
          emitter,
        ),
        HomeEventOnInvitationRejected() => _onInvitationRejected(
          event,
          emitter,
        ),
        HomeEventOnGameStarted() => _onGameStarted(event, emitter),
        _ => throw UnimplementedError('Unhandled event: $event'),
      },
    );

    // Подписка на найденные устройства
    _discoveredDevicesSubscription = _bluetoothRepository.discoveredDevices
        .listen(_updateDiscoveredDevices);

    // Подписка на входящие данные
    _incomingDataSubscription = _bluetoothRepository.incomingMessages.listen(
      _handleIncomingMessage,
    );

    add(const HomeEvent.onInitializationRequested());
  }

  final IUserRepository _playerRepository;
  final IBluetoothRepository _bluetoothRepository;

  late final StreamSubscription<List<Device>> _discoveredDevicesSubscription;
  late final StreamSubscription<Message> _incomingDataSubscription;

  List<Device> _devices = [];
  Device? _selectedDevice;
  User? _currentUser;
  HomeStateView? _viewState;

  @override
  Future<void> close() {
    _discoveredDevicesSubscription.cancel();
    _incomingDataSubscription.cancel();
    _bluetoothRepository.dispose();
    return super.close();
  }

  /// Обработчик запроса инициализации
  Future<void> _onInitializationRequested(Emitter<HomeState> emitter) async {
    try {
      // Получаем текущего игрока
      _currentUser = await _playerRepository.getCurrentUser();

      // Проверяем, является ли это первым запуском
      final isFirstLaunch = await _playerRepository.isFirstLaunch();

      // Запускаем рекламу и поиск устройств
      await _bluetoothRepository.startAdvertising();
      await _bluetoothRepository.startDiscovery();

      _viewState = HomeStateView(
        devices: _devices,
        selectedDevice: _selectedDevice,
        isFirstLaunch: isFirstLaunch,
      );
      emitter(_viewState!);
    } catch (e) {
      emitter(HomeState.initializationError(message: e.toString()));
    }
  }

  /// Обработчик ручного обновления
  Future<void> _onRefreshRequested(Emitter<HomeState> emitter) async {
    try {
      await _bluetoothRepository.stopDiscovery();
      await _bluetoothRepository.startDiscovery();
    } catch (e) {
      emitter(HomeState.initializationError(message: 'Ошибка обновления: $e'));
    }
  }

  /// Обработчик выбора игрока
  Future<void> _onDeviceSelected(
    HomeEventOnDeviceSelected event,
    Emitter<HomeState> emitter,
  ) async {
    _selectedDevice = event.device;

    if (_viewState != null) {
      _viewState = _viewState!.copyWith(selectedDevice: _selectedDevice);
      emitter(_viewState!);
    }
  }

  /// Обработчик приглашения игрока
  Future<void> _onInvite(Emitter<HomeState> emitter) async {
    try {
      if (_currentUser == null) {
        throw StateError('Текущий пользователь не инициализирован');
      }
      // Приглашаем пользователя: в нашей модели отправляем InvitationMessage
      final connected = _bluetoothRepository.connectedDevice;
      if (connected == null) {
        if (_selectedDevice == null) {
          throw StateError('Устройство не выбрано');
        }
        await _bluetoothRepository.connectToDevice(_selectedDevice!);
      }

      await _bluetoothRepository.sendMessage(
        InvitationMessage(
          device: _bluetoothRepository.connectedDevice ?? _selectedDevice!,
          user: _currentUser!,
        ),
      );

      emitter(HomeState.invitationPending(invitedDevice: _selectedDevice!));
    } catch (e) {
      emitter(
        HomeState.initializationError(
          message: 'Ошибка отправки приглашения: $e',
        ),
      );
    }
  }

  /// Обработчик отмены приглашения
  Future<void> _onCancelInvitation(Emitter<HomeState> emitter) async {
    try {
      final device = _bluetoothRepository.connectedDevice;
      if (device == null || _currentUser == null) {
        throw StateError(
          'Нет активного соединения или пользователь не инициализирован',
        );
      }
      await _bluetoothRepository.sendMessage(
        TerminationMessage(device: device, user: _currentUser!),
      );

      if (_viewState != null) {
        emitter(_viewState!);
      }
    } catch (e) {
      emitter(
        HomeState.initializationError(message: 'Ошибка отмены приглашения: $e'),
      );
    }
  }

  /// Обработчик принятия приглашения
  Future<void> _onAcceptInvitation(Emitter<HomeState> emitter) async {
    try {
      final device = _bluetoothRepository.connectedDevice;
      if (device == null || _currentUser == null) {
        throw StateError(
          'Нет активного соединения или пользователь не инициализирован',
        );
      }

      // Приглашённый получает O. Удалённой стороне (пригласившему) назначаем X
      await _bluetoothRepository.sendMessage(
        RoleAssignmentMessage(
          device: device,
          user: _currentUser!,
          assignedType: PlayerType.x,
        ),
      );

      await _bluetoothRepository.sendMessage(
        AcceptanceMessage(device: device, user: _currentUser!),
      );

      // Переходим к игре
      final currentState = state;
      if (currentState is HomeStateInvitationReceived) {
        emitter(
          HomeState.gameStarted(
            opponent: currentState.invitingUser,
            myPlayerType: PlayerType.o,
          ),
        );
      }
    } catch (e) {
      emitter(
        HomeState.initializationError(
          message: 'Ошибка принятия приглашения: $e',
        ),
      );
    }
  }

  /// Обработчик отклонения приглашения
  Future<void> _onRejectInvitation(Emitter<HomeState> emitter) async {
    try {
      await _bluetoothRepository.sendMessage(
        RejectionMessage(
          device: _bluetoothRepository.connectedDevice!,
          user: _currentUser!,
        ),
      );

      final currentState = state;
      if (currentState is HomeStateInvitationReceived) {
        emitter(HomeState.invitationRejected(rejectedUser: _currentUser!));
      }
    } catch (e) {
      emitter(
        HomeState.initializationError(
          message: 'Ошибка отклонения приглашения: $e',
        ),
      );
    }
  }

  /// Обработчик сохранения псевдонима
  Future<void> _onNicknameSaved(
    HomeEventOnNicknameSaved event,
    Emitter<HomeState> emitter,
  ) async {
    try {
      final user = User(id: 'local_user', name: event.nickname);

      await _playerRepository.saveCurrentUser(user);
      _currentUser = user;

      // Устанавливаем флаг первого запуска
      await _playerRepository.setFirstLaunch(false);

      // Обновляем состояние
      if (_viewState != null) {
        _viewState = _viewState!.copyWith(isFirstLaunch: false);
        emitter(_viewState!);
      }
    } catch (e) {
      emitter(
        HomeState.initializationError(
          message: 'Ошибка сохранения псевдонима: $e',
        ),
      );
    }
  }

  /// Обработчик изменения состояния представления
  void _onViewStateChanged(Emitter<HomeState> emitter) {
    emitter(_viewState!);
  }

  /// Обработчик получения приглашения
  void _onInvitationReceived(
    HomeEventOnInvitationReceived event,
    Emitter<HomeState> emitter,
  ) {
    emitter(HomeState.invitationReceived(invitingUser: event.invitingUser));
  }

  /// Обработчик отклонения приглашения
  void _onInvitationRejected(
    HomeEventOnInvitationRejected event,
    Emitter<HomeState> emitter,
  ) {
    emitter(HomeState.invitationRejected(rejectedUser: event.rejectedUser));
  }

  /// Обработчик начала игры
  void _onGameStarted(
    HomeEventOnGameStarted event,
    Emitter<HomeState> emitter,
  ) {
    // Если мы пригласившая сторона, мы X; если приняли приглашение — мы уже эмитили с O
    emitter(
      HomeState.gameStarted(
        opponent: event.opponent,
        myPlayerType: PlayerType.x,
      ),
    );
  }

  /// Обновление списка найденных устройств
  void _updateDiscoveredDevices(List<Device> devices) {
    if (isClosed) return;
    _devices = devices;

    if (_viewState == null) return;
    _viewState = _viewState!.copyWith(devices: _devices);
    add(const HomeEvent.onViewStateChanged());
  }

  /// Обработка входящих данных
  void _handleIncomingMessage(Message message) {
    if (isClosed) return;
    switch (message) {
      case InvitationMessage(:final user):
        add(HomeEvent.onInvitationReceived(invitingUser: user));
      case AcceptanceMessage(:final user):
        final currentState = state;
        if (currentState is HomeStateInvitationPending) {
          // Мы пригласили → мы X. Унифицируем запуск через событие
          add(HomeEvent.onGameStarted(opponent: user));
        }
      case RejectionMessage(:final user):
        final currentState = state;
        if (currentState is HomeStateInvitationPending) {
          add(HomeEvent.onInvitationRejected(rejectedUser: user));
        }
      case TerminationMessage():
        if (_viewState == null) return;
        add(const HomeEvent.onViewStateChanged());
      case OpponentLeftMessage():
        if (_viewState == null) return;
        add(const HomeEvent.onViewStateChanged());
      case RoleAssignmentMessage():
        // Пробрасывается в GameBloc через аргументы route (см. game_screen)
        // Здесь можно сохранить в локальный стейт при надобности
        break;
      case MoveMessage():
        // Игровые сообщения обрабатываются GameBloc, игнорируем здесь
        break;
    }
  }
}
