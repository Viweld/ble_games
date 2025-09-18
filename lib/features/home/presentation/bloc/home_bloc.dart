import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dep_gen/dep_gen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/models/device.dart';
import '../../../../core/domain/models/messages.dart';
import '../../../../core/domain/models/user.dart';
import '../../../../core/repositories/i_user_repository.dart';
import '../../../../core/repositories/i_bluetooth_repository.dart';
import '../../../tictactoe/domain/models/enums/player_type.dart';

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
        HomeEventOnStartAwaitingConnection() => _onStartAwaitingConnection(
          emitter,
        ),
        HomeEventOnStartSearchingDevices() => _onStartSearchingDevices(emitter),
        HomeEventOnCancelAwaiting() => _onCancelAwaiting(emitter),
        HomeEventOnCancelSearching() => _onCancelSearching(emitter),
        HomeEventOnConnectToDevice() => _onConnectToDevice(emitter),
        HomeEventOnDeviceSelected() => _onDeviceSelected(event, emitter),
        HomeEventOnViewStateChanged() => _onViewStateChanged(emitter),
        HomeEventOnNicknameSaved() => _onNicknameSaved(event, emitter),
        HomeEventOnInvitationReceived() => _onInvitationReceived(
          event,
          emitter,
        ),
        HomeEventOnInvitationRejected() => _onInvitationRejected(
          event,
          emitter,
        ),
        HomeEventOnGameStarted() => _onGameStarted(event, emitter),
        HomeEventOnAcceptInvitation() => _onAcceptInvitation(emitter),
        HomeEventOnRejectInvitation() => _onRejectInvitation(emitter),
        HomeEventOnSendMessage() => _onSendMessage(event, emitter),
        HomeEventOnNavigateToMessageTest() => _onNavigateToMessageTest(emitter),
        HomeEventOnNavigateToConnectionTest() => _onNavigateToConnectionTest(
          emitter,
        ),
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

      // Инициализируем Bluetooth
      await _bluetoothRepository.initialize();

      // Переходим к основному состоянию
      emitter(const HomeState.view());
    } catch (e) {
      emitter(HomeState.initializationError(message: e.toString()));
    }
  }

  /// Обработчик начала ожидания подключения
  Future<void> _onStartAwaitingConnection(Emitter<HomeState> emitter) async {
    try {
      // Запускаем рекламу устройства
      await _bluetoothRepository.startAdvertising();

      // Переходим в режим ожидания
      emitter(const HomeState.awaitingConnection());
    } catch (e) {
      emitter(
        HomeState.initializationError(
          message: 'Ошибка запуска режима ожидания: $e',
        ),
      );
    }
  }

  /// Обработчик начала поиска устройств
  Future<void> _onStartSearchingDevices(Emitter<HomeState> emitter) async {
    try {
      // Очищаем список устройств
      _devices = [];
      _selectedDevice = null;

      // Убеждаемся, что Bluetooth инициализирован
      await _bluetoothRepository.initialize();

      // Запускаем поиск
      await _bluetoothRepository.startDiscovery();

      // Переходим в режим поиска
      emitter(
        HomeState.searchingDevices(
          devices: _devices,
          selectedDevice: _selectedDevice,
        ),
      );
    } catch (e) {
      emitter(
        HomeState.initializationError(message: 'Ошибка запуска поиска: $e'),
      );
    }
  }

  /// Обработчик отмены ожидания
  Future<void> _onCancelAwaiting(Emitter<HomeState> emitter) async {
    try {
      // Останавливаем рекламу
      await _bluetoothRepository.stopAdvertising();

      // Возвращаемся к основному состоянию
      emitter(const HomeState.view());
    } catch (e) {
      emitter(
        HomeState.initializationError(message: 'Ошибка отмены ожидания: $e'),
      );
    }
  }

  /// Обработчик отмены поиска устройств
  Future<void> _onCancelSearching(Emitter<HomeState> emitter) async {
    try {
      // Останавливаем поиск
      await _bluetoothRepository.stopDiscovery();

      // Возвращаемся к основному состоянию
      emitter(const HomeState.view());
    } catch (e) {
      emitter(
        HomeState.initializationError(message: 'Ошибка отмены поиска: $e'),
      );
    }
  }

  /// Обработчик подключения к устройству
  Future<void> _onConnectToDevice(Emitter<HomeState> emitter) async {
    try {
      if (_selectedDevice == null) {
        emitter(
          const HomeState.initializationError(
            message: 'Не выбрано устройство для подключения',
          ),
        );
        return;
      }

      // Подключаемся к устройству
      await _bluetoothRepository.connectToDevice(_selectedDevice!);

      // Переходим к тестированию сообщений
      emitter(const HomeState.messageTestView());
    } catch (e) {
      emitter(HomeState.initializationError(message: 'Ошибка подключения: $e'));
    }
  }

  /// Обработчик выбора устройства
  Future<void> _onDeviceSelected(
    HomeEventOnDeviceSelected event,
    Emitter<HomeState> emitter,
  ) async {
    _selectedDevice = event.device;

    final currentState = state;
    if (currentState is HomeStateSearchingDevices) {
      emitter(currentState.copyWith(selectedDevice: _selectedDevice));
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

      // Переходим к основному экрану
      emitter(const HomeState.view());
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
    final currentState = state;
    if (currentState is HomeStateSearchingDevices) {
      emitter(
        currentState.copyWith(
          devices: _devices,
          selectedDevice: _selectedDevice,
        ),
      );
    }
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

  /// Обработчик принятия приглашения
  Future<void> _onAcceptInvitation(Emitter<HomeState> emitter) async {
    try {
      // Отправляем сообщение о принятии
      if (_bluetoothRepository.isConnected && _currentUser != null) {
        final acceptanceMessage = AcceptanceMessage(
          device: _bluetoothRepository.connectedDevice!,
          user: _currentUser!,
        );
        await _bluetoothRepository.sendMessage(acceptanceMessage);
      }

      // Переходим к тестированию сообщений
      emitter(const HomeState.messageTestView());
    } catch (e) {
      emitter(HomeState.connectionError(message: 'Ошибка принятия: $e'));
    }
  }

  /// Обработчик отклонения приглашения
  Future<void> _onRejectInvitation(Emitter<HomeState> emitter) async {
    try {
      // Отправляем сообщение об отказе
      if (_bluetoothRepository.isConnected && _currentUser != null) {
        final rejectionMessage = RejectionMessage(
          device: _bluetoothRepository.connectedDevice!,
          user: _currentUser!,
        );
        await _bluetoothRepository.sendMessage(rejectionMessage);
      }

      // Возвращаемся к основному состоянию
      emitter(const HomeState.view());
    } catch (e) {
      emitter(HomeState.connectionError(message: 'Ошибка отклонения: $e'));
    }
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

  /// Обработчик отправки сообщения
  Future<void> _onSendMessage(
    HomeEventOnSendMessage event,
    Emitter<HomeState> emitter,
  ) async {
    try {
      if (_bluetoothRepository.isConnected && _currentUser != null) {
        // Отправляем тестовое сообщение
        final testMessage = InvitationMessage(
          device: _bluetoothRepository.connectedDevice!,
          user: _currentUser!,
        );
        await _bluetoothRepository.sendMessage(testMessage);
        emitter(const HomeState.messageSent());
      } else {
        emitter(
          const HomeState.connectionError(
            message: 'Нет подключения к устройству',
          ),
        );
      }
    } catch (e) {
      emitter(HomeState.connectionError(message: 'Ошибка отправки: $e'));
    }
  }

  /// Обработчик навигации к тестированию сообщений
  void _onNavigateToMessageTest(Emitter<HomeState> emitter) {
    emitter(const HomeState.messageTestView());
  }

  /// Обработчик возврата к тестированию соединения
  void _onNavigateToConnectionTest(Emitter<HomeState> emitter) {
    emitter(const HomeState.view());
  }

  /// Обновление списка найденных устройств
  void _updateDiscoveredDevices(List<Device> devices) {
    if (isClosed) return;
    _devices = devices;

    final currentState = state;
    if (currentState is HomeStateSearchingDevices) {
      // Обновляем состояние поиска с новым списком устройств
      add(const HomeEvent.onViewStateChanged());
    }
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
        } else {
          // Для тестирования сообщений
          add(HomeEvent.onMessageReceived(message: message));
        }
      case RejectionMessage(:final user):
        final currentState = state;
        if (currentState is HomeStateInvitationPending) {
          add(HomeEvent.onInvitationRejected(rejectedUser: user));
        } else {
          // Для тестирования сообщений
          add(HomeEvent.onMessageReceived(message: message));
        }
      case TerminationMessage():
        final currentState = state;
        if (currentState is HomeStateAwaitingConnection ||
            currentState is HomeStateSearchingDevices) {
          add(const HomeEvent.onViewStateChanged());
        } else {
          // Для тестирования сообщений
          add(HomeEvent.onMessageReceived(message: message));
        }
      case MoveMessage():
        // Игровые сообщения обрабатываются GameBloc, игнорируем здесь
        break;
      case RoleAssignmentMessage():
        // Пробрасывается в GameBloc через аргументы route (см. game_screen)
        // Здесь можно сохранить в локальный стейт при надобности
        break;
      case OpponentLeftMessage():
        final currentState = state;
        if (currentState is HomeStateAwaitingConnection ||
            currentState is HomeStateSearchingDevices) {
          add(const HomeEvent.onViewStateChanged());
        } else {
          // Для тестирования сообщений
          add(HomeEvent.onMessageReceived(message: message));
        }
      default:
        // Для тестирования сообщений
        add(HomeEvent.onMessageReceived(message: message));
    }
  }
}
