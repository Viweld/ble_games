import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dep_gen/dep_gen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/models/device.dart';
import '../../../../core/domain/models/messages.dart';
import '../../../../core/domain/models/user.dart';
import '../../../../core/domain/repositories/i_user_repository.dart';
import '../../../../core/domain/services/bluetooth_manager/i_bluetooth_manager.dart';
import '../../../tictactoe/domain/models/enums/player_type.dart';

part 'events.dart';

part 'states.dart';

part 'home_bloc.freezed.dart';

/// BLoC для главного экрана
@DepGen()
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    @DepArg() required IUserRepository playerRepository,
    @DepArg() required IBluetoothManager bluetoothRepository,
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

    _discoveredDevicesSubscription = _bluetoothRepository.discoveredDevices
        .listen(_updateDiscoveredDevices);
    _incomingDataSubscription = _bluetoothRepository.incomingMessages.listen(
      _handleIncomingMessage,
    );
    _clientConnectionSubscription = _bluetoothRepository.clientConnections
        .listen(_handleClientConnection);
    add(const HomeEvent.onInitializationRequested());
  }

  final IUserRepository _playerRepository;
  final IBluetoothManager _bluetoothRepository;

  late final StreamSubscription<List<Device>> _discoveredDevicesSubscription;
  late final StreamSubscription<Message> _incomingDataSubscription;
  late final StreamSubscription<String> _clientConnectionSubscription;

  List<Device> _devices = [];
  Device? _selectedDevice;
  User? _currentUser;

  @override
  Future<void> close() {
    _discoveredDevicesSubscription.cancel();
    _incomingDataSubscription.cancel();
    _clientConnectionSubscription.cancel();
    _bluetoothRepository.dispose();
    return super.close();
  }

  /// Обработчик запроса инициализации
  Future<void> _onInitializationRequested(Emitter<HomeState> emitter) async {
    try {
      _currentUser = await _playerRepository.getCurrentUser();
      emitter(const HomeState.view());
    } catch (e) {
      emitter(HomeState.initializationError(message: e.toString()));
    }
  }

  /// Обработчик начала ожидания подключения
  Future<void> _onStartAwaitingConnection(Emitter<HomeState> emitter) async {
    try {
      await _bluetoothRepository.startAdvertising();
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
      _devices = [];
      _selectedDevice = null;
      await _bluetoothRepository.startDiscovery();
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
      await _bluetoothRepository.stopAdvertising();
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
      await _bluetoothRepository.stopDiscovery();
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
      await _bluetoothRepository.connectToDevice(_selectedDevice!);
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
    if (currentState is! HomeStateSearchingDevices) return;
    emitter(currentState.copyWith(selectedDevice: _selectedDevice));
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
      await _playerRepository.setFirstLaunch(false);
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
    if (currentState is! HomeStateSearchingDevices) return;
    emitter(
      currentState.copyWith(devices: _devices, selectedDevice: _selectedDevice),
    );
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
    emitter(
      HomeState.gameStarted(
        opponent: event.opponent,
        myPlayerType: PlayerType.x,
      ),
    );
  }

  /// Обработчик принятия приглашения
  Future<void> _onAcceptInvitation(Emitter<HomeState> emitter) async {
    try {
      final currentUser =
          _currentUser ?? User(id: 'temp_user', name: 'Тестовый пользователь');
      // Отправляем сообщение о принятии
      if (_bluetoothRepository.isConnected) {
        final acceptanceMessage = AcceptanceMessage(
          device: _bluetoothRepository.connectedDevice!,
          user: currentUser,
        );
        await _bluetoothRepository.sendMessage(acceptanceMessage);
      }
      emitter(const HomeState.messageTestView());
    } catch (e) {
      emitter(HomeState.connectionError(message: 'Ошибка принятия: $e'));
    }
  }

  /// Обработчик отклонения приглашения
  Future<void> _onRejectInvitation(Emitter<HomeState> emitter) async {
    try {
      final currentUser =
          _currentUser ?? User(id: 'temp_user', name: 'Тестовый пользователь');

      if (_bluetoothRepository.isConnected) {
        final rejectionMessage = RejectionMessage(
          device: _bluetoothRepository.connectedDevice!,
          user: currentUser,
        );
        await _bluetoothRepository.sendMessage(rejectionMessage);
      }
      emitter(const HomeState.view());
    } catch (e) {
      emitter(HomeState.connectionError(message: 'Ошибка отклонения: $e'));
    }
  }

  /// Обработчик отправки сообщения
  Future<void> _onSendMessage(
    HomeEventOnSendMessage event,
    Emitter<HomeState> emitter,
  ) async {
    try {
      final currentUser =
          _currentUser ?? User(id: 'temp_user', name: 'Тестовый пользователь');

      if (_bluetoothRepository.isConnected) {
        final testMessage = InvitationMessage(
          device: _bluetoothRepository.connectedDevice!,
          user: currentUser,
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
    } on Exception catch (e) {
      if (e.toString().contains('статус 133') ||
          e.toString().contains('GATT_ERROR') ||
          e.toString().contains('IllegalStateException')) {
        emitter(
          const HomeState.connectionError(
            message:
                'Ошибка соединения Bluetooth (статус 133). Соединение было сброшено. Пожалуйста, подключитесь заново к устройству.',
          ),
        );
      } else {
        emitter(HomeState.connectionError(message: 'Ошибка отправки: $e'));
      }
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

    if (currentState is! HomeStateSearchingDevices) return;
    add(const HomeEvent.onViewStateChanged());
  }

  /// Обработка входящих данных
  void _handleIncomingMessage(Message message) {
    if (isClosed) return;
    final currentState = state;
    switch (message) {
      case InvitationMessage(:final user):
        if (currentState is HomeStateAwaitingConnection) {
          add(const HomeEvent.onAcceptInvitation());
        } else {
          add(HomeEvent.onInvitationReceived(invitingUser: user));
        }
      case AcceptanceMessage(:final user):
        final currentState = state;
        if (currentState is HomeStateInvitationPending) {
          add(HomeEvent.onGameStarted(opponent: user));
        } else if (currentState is HomeStateAwaitingConnection) {
          add(const HomeEvent.onNavigateToMessageTest());
        } else {
          add(HomeEvent.onMessageReceived(message: message));
        }
      case RejectionMessage(:final user):
        final currentState = state;
        if (currentState is HomeStateInvitationPending) {
          add(HomeEvent.onInvitationRejected(rejectedUser: user));
        } else {
          add(HomeEvent.onMessageReceived(message: message));
        }
      case TerminationMessage():
        final currentState = state;
        if (currentState is HomeStateAwaitingConnection ||
            currentState is HomeStateSearchingDevices) {
          add(const HomeEvent.onViewStateChanged());
        } else {
          add(HomeEvent.onMessageReceived(message: message));
        }
      case MoveMessage():
        break;
      case RoleAssignmentMessage():
        break;
      case OpponentLeftMessage():
        final currentState = state;
        if (currentState is HomeStateAwaitingConnection ||
            currentState is HomeStateSearchingDevices) {
          add(const HomeEvent.onViewStateChanged());
        } else {
          add(HomeEvent.onMessageReceived(message: message));
        }
    }
  }

  /// Обработка подключений клиентов (для сервера)
  void _handleClientConnection(String clientId) {
    if (isClosed) return;
    final currentState = state;
    if (currentState is! HomeStateAwaitingConnection) return;
    final currentUser = _currentUser ?? User(id: 'server_user', name: 'Сервер');
    final invitationMessage = InvitationMessage(
      device: Device(id: clientId, name: 'Клиент', isOurApp: true),
      user: currentUser,
    );
    _bluetoothRepository.sendMessage(invitationMessage).catchError((error) {});
  }
}
