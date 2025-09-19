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
    print('[DEBUG] HomeBloc конструктор вызван');

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

    print('[DEBUG] Подписка на discoveredDevices...');
    // Подписка на найденные устройства
    _discoveredDevicesSubscription = _bluetoothRepository.discoveredDevices
        .listen(_updateDiscoveredDevices);

    print('[DEBUG] Подписка на incomingMessages...');
    // Подписка на входящие данные
    _incomingDataSubscription = _bluetoothRepository.incomingMessages.listen(
      _handleIncomingMessage,
    );

    // Подписка на подключения клиентов (для сервера)
    _clientConnectionSubscription = _bluetoothRepository.clientConnections
        .listen(_handleClientConnection);

    print('[DEBUG] Добавление события onInitializationRequested');
    add(const HomeEvent.onInitializationRequested());
  }

  final IUserRepository _playerRepository;
  final IBluetoothRepository _bluetoothRepository;

  late final StreamSubscription<List<Device>> _discoveredDevicesSubscription;
  late final StreamSubscription<Message> _incomingDataSubscription;
  late final StreamSubscription<String>
  _clientConnectionSubscription; // Подписка на подключения клиентов

  List<Device> _devices = [];
  Device? _selectedDevice;
  User? _currentUser;

  @override
  Future<void> close() {
    print('[DEBUG] HomeBloc.close() вызван');

    print('[DEBUG] Отмена подписки _discoveredDevicesSubscription');
    _discoveredDevicesSubscription.cancel();

    print('[DEBUG] Отмена подписки _incomingDataSubscription');
    _incomingDataSubscription.cancel();

    print('[DEBUG] Отмена подписки _clientConnectionSubscription');
    _clientConnectionSubscription.cancel();

    print('[DEBUG] Вызов dispose() у BluetoothRepository');
    _bluetoothRepository.dispose();

    print('[DEBUG] Вызов super.close()');
    return super.close();
  }

  /// Обработчик запроса инициализации
  Future<void> _onInitializationRequested(Emitter<HomeState> emitter) async {
    print('[DEBUG] _onInitializationRequested вызван');

    try {
      print('[DEBUG] Получение текущего пользователя...');
      // Получаем текущего игрока
      _currentUser = await _playerRepository.getCurrentUser();
      print('[DEBUG] Текущий пользователь: ${_currentUser?.name}');

      print('[DEBUG] Инициализация Bluetooth...');
      // Инициализируем Bluetooth
      await _bluetoothRepository.initialize();

      print('[DEBUG] Инициализация завершена, переход к основному состоянию');
      // Переходим к основному состоянию
      emitter(const HomeState.view());
    } catch (e) {
      print('[ERROR] Ошибка инициализации: $e');
      emitter(HomeState.initializationError(message: e.toString()));
    }
  }

  /// Обработчик начала ожидания подключения
  Future<void> _onStartAwaitingConnection(Emitter<HomeState> emitter) async {
    print('[DEBUG] _onStartAwaitingConnection вызван');

    try {
      print('[DEBUG] Запуск рекламы устройства...');
      // Запускаем рекламу устройства
      await _bluetoothRepository.startAdvertising();

      print('[DEBUG] Реклама запущена, переход в режим ожидания');
      // Переходим в режим ожидания
      emitter(const HomeState.awaitingConnection());
    } catch (e) {
      print('[ERROR] Ошибка запуска режима ожидания: $e');
      emitter(
        HomeState.initializationError(
          message: 'Ошибка запуска режима ожидания: $e',
        ),
      );
    }
  }

  /// Обработчик начала поиска устройств
  Future<void> _onStartSearchingDevices(Emitter<HomeState> emitter) async {
    print('[DEBUG] _onStartSearchingDevices вызван');

    try {
      print('[DEBUG] Очистка списка устройств...');
      // Очищаем список устройств
      _devices = [];
      _selectedDevice = null;

      print('[DEBUG] Проверка инициализации Bluetooth...');
      // Убеждаемся, что Bluetooth инициализирован
      await _bluetoothRepository.initialize();

      print('[DEBUG] Запуск поиска устройств...');
      // Запускаем поиск
      await _bluetoothRepository.startDiscovery();

      print('[DEBUG] Поиск запущен, переход в режим поиска');
      // Переходим в режим поиска
      emitter(
        HomeState.searchingDevices(
          devices: _devices,
          selectedDevice: _selectedDevice,
        ),
      );
    } catch (e) {
      print('[ERROR] Ошибка запуска поиска: $e');
      emitter(
        HomeState.initializationError(message: 'Ошибка запуска поиска: $e'),
      );
    }
  }

  /// Обработчик отмены ожидания
  Future<void> _onCancelAwaiting(Emitter<HomeState> emitter) async {
    print('[DEBUG] _onCancelAwaiting вызван');

    try {
      print('[DEBUG] Остановка рекламы...');
      // Останавливаем рекламу
      await _bluetoothRepository.stopAdvertising();

      print('[DEBUG] Реклама остановлена, возврат к основному состоянию');
      // Возвращаемся к основному состоянию
      emitter(const HomeState.view());
    } catch (e) {
      print('[ERROR] Ошибка отмены ожидания: $e');
      emitter(
        HomeState.initializationError(message: 'Ошибка отмены ожидания: $e'),
      );
    }
  }

  /// Обработчик отмены поиска устройств
  Future<void> _onCancelSearching(Emitter<HomeState> emitter) async {
    print('[DEBUG] _onCancelSearching вызван');

    try {
      print('[DEBUG] Остановка поиска устройств...');
      // Останавливаем поиск
      await _bluetoothRepository.stopDiscovery();

      print('[DEBUG] Поиск остановлен, возврат к основному состоянию');
      // Возвращаемся к основному состоянию
      emitter(const HomeState.view());
    } catch (e) {
      print('[ERROR] Ошибка отмены поиска: $e');
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

      print(
        '[DEBUG] Подключение к устройству: ${_selectedDevice!.name} (${_selectedDevice!.id})',
      );

      // Подключаемся к устройству
      await _bluetoothRepository.connectToDevice(_selectedDevice!);

      print('[DEBUG] Подключение успешно, переход к тестированию сообщений');
      // Переходим к тестированию сообщений
      emitter(const HomeState.messageTestView());
    } catch (e) {
      print('[ERROR] Ошибка подключения: $e');
      emitter(HomeState.initializationError(message: 'Ошибка подключения: $e'));
    }
  }

  /// Обработчик выбора устройства
  Future<void> _onDeviceSelected(
    HomeEventOnDeviceSelected event,
    Emitter<HomeState> emitter,
  ) async {
    print(
      '[DEBUG] _onDeviceSelected вызван с устройством: ${event.device.name}',
    );

    _selectedDevice = event.device;
    print('[DEBUG] Выбранное устройство установлено: ${_selectedDevice?.name}');

    final currentState = state;
    print('[DEBUG] Текущее состояние: ${currentState.runtimeType}');

    if (currentState is HomeStateSearchingDevices) {
      print('[DEBUG] Обновление состояния поиска с выбранным устройством');
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
    print('[DEBUG] _onViewStateChanged вызван');

    final currentState = state;
    print('[DEBUG] Текущее состояние: ${currentState.runtimeType}');

    if (currentState is HomeStateSearchingDevices) {
      print(
        '[DEBUG] Обновление состояния поиска с ${_devices.length} устройствами',
      );
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
    print(
      '[DEBUG] _onInvitationReceived вызван с пользователем: ${event.invitingUser.name}',
    );
    print('[DEBUG] Эмитим HomeState.invitationReceived');
    emitter(HomeState.invitationReceived(invitingUser: event.invitingUser));
  }

  /// Обработчик отклонения приглашения
  void _onInvitationRejected(
    HomeEventOnInvitationRejected event,
    Emitter<HomeState> emitter,
  ) {
    print(
      '[DEBUG] _onInvitationRejected вызван с пользователем: ${event.rejectedUser.name}',
    );
    print('[DEBUG] Эмитим HomeState.invitationRejected');
    emitter(HomeState.invitationRejected(rejectedUser: event.rejectedUser));
  }

  /// Обработчик начала игры
  void _onGameStarted(
    HomeEventOnGameStarted event,
    Emitter<HomeState> emitter,
  ) {
    print('[DEBUG] _onGameStarted вызван с оппонентом: ${event.opponent.name}');

    // Если мы пригласившая сторона, мы X; если приняли приглашение — мы уже эмитили с O
    print('[DEBUG] Эмитим HomeState.gameStarted с типом игрока X');
    emitter(
      HomeState.gameStarted(
        opponent: event.opponent,
        myPlayerType: PlayerType.x,
      ),
    );
  }

  /// Обработчик принятия приглашения
  Future<void> _onAcceptInvitation(Emitter<HomeState> emitter) async {
    print('[DEBUG] _onAcceptInvitation вызван');

    try {
      print('[DEBUG] Проверка состояния подключения...');
      print('[DEBUG] isConnected: ${_bluetoothRepository.isConnected}');
      print('[DEBUG] currentUser: ${_currentUser?.name}');

      // Если пользователь не установлен, создаем временного пользователя для тестирования
      final currentUser =
          _currentUser ?? User(id: 'temp_user', name: 'Тестовый пользователь');
      if (_currentUser == null) {
        print(
          '[DEBUG] Пользователь не найден, используем временного пользователя',
        );
      }

      // Отправляем сообщение о принятии
      if (_bluetoothRepository.isConnected) {
        print('[DEBUG] Подключение активно, отправка сообщения о принятии...');
        final acceptanceMessage = AcceptanceMessage(
          device: _bluetoothRepository.connectedDevice!,
          user: currentUser,
        );
        await _bluetoothRepository.sendMessage(acceptanceMessage);
        print('[DEBUG] Сообщение о принятии отправлено');
      }

      print('[DEBUG] Переход к тестированию сообщений');
      // Переходим к тестированию сообщений
      emitter(const HomeState.messageTestView());
    } catch (e) {
      print('[ERROR] Ошибка принятия приглашения: $e');
      emitter(HomeState.connectionError(message: 'Ошибка принятия: $e'));
    }
  }

  /// Обработчик отклонения приглашения
  Future<void> _onRejectInvitation(Emitter<HomeState> emitter) async {
    print('[DEBUG] _onRejectInvitation вызван');

    try {
      print('[DEBUG] Проверка состояния подключения...');
      print('[DEBUG] isConnected: ${_bluetoothRepository.isConnected}');
      print('[DEBUG] currentUser: ${_currentUser?.name}');

      // Если пользователь не установлен, создаем временного пользователя для тестирования
      final currentUser =
          _currentUser ?? User(id: 'temp_user', name: 'Тестовый пользователь');
      if (_currentUser == null) {
        print(
          '[DEBUG] Пользователь не найден, используем временного пользователя',
        );
      }

      // Отправляем сообщение об отказе
      if (_bluetoothRepository.isConnected) {
        print('[DEBUG] Подключение активно, отправка сообщения об отказе...');
        final rejectionMessage = RejectionMessage(
          device: _bluetoothRepository.connectedDevice!,
          user: currentUser,
        );
        await _bluetoothRepository.sendMessage(rejectionMessage);
        print('[DEBUG] Сообщение об отказе отправлено');
      }

      print('[DEBUG] Возврат к основному состоянию');
      // Возвращаемся к основному состоянию
      emitter(const HomeState.view());
    } catch (e) {
      print('[ERROR] Ошибка отклонения приглашения: $e');
      emitter(HomeState.connectionError(message: 'Ошибка отклонения: $e'));
    }
  }

  /// Обработчик отправки сообщения
  Future<void> _onSendMessage(
    HomeEventOnSendMessage event,
    Emitter<HomeState> emitter,
  ) async {
    print('[DEBUG] _onSendMessage вызван с содержимым: ${event.content}');

    try {
      print('[DEBUG] Проверка состояния подключения...');
      print('[DEBUG] isConnected: ${_bluetoothRepository.isConnected}');
      print('[DEBUG] currentUser: ${_currentUser?.name}');

      // Если пользователь не установлен, создаем временного пользователя для тестирования
      final currentUser =
          _currentUser ?? User(id: 'temp_user', name: 'Тестовый пользователь');
      if (_currentUser == null) {
        print(
          '[DEBUG] Пользователь не найден, используем временного пользователя',
        );
      }

      if (_bluetoothRepository.isConnected) {
        print('[DEBUG] Подключение активно, отправка сообщения...');
        // Отправляем тестовое сообщение
        final testMessage = InvitationMessage(
          device: _bluetoothRepository.connectedDevice!,
          user: currentUser,
        );
        print('[DEBUG] Отправка сообщения через BluetoothRepository...');
        await _bluetoothRepository.sendMessage(testMessage);
        print('[DEBUG] Сообщение отправлено, эмитим HomeState.messageSent()');
        emitter(const HomeState.messageSent());
      } else {
        print('[DEBUG] Нет подключения к устройству');
        emitter(
          const HomeState.connectionError(
            message: 'Нет подключения к устройству',
          ),
        );
      }
    } on Exception catch (e) {
      print('[ERROR] Ошибка отправки сообщения: $e');

      // Проверяем, является ли это ошибкой статуса 133
      if (e.toString().contains('статус 133') ||
          e.toString().contains('GATT_ERROR') ||
          e.toString().contains('IllegalStateException')) {
        print(
          '[DEBUG] Обнаружена ошибка статуса 133. Предлагаем переподключение.',
        );
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
    print('[DEBUG] _onNavigateToMessageTest вызван');
    print('[DEBUG] Эмитим HomeState.messageTestView');
    emitter(const HomeState.messageTestView());
  }

  /// Обработчик возврата к тестированию соединения
  void _onNavigateToConnectionTest(Emitter<HomeState> emitter) {
    print('[DEBUG] _onNavigateToConnectionTest вызван');
    print('[DEBUG] Эмитим HomeState.view');
    emitter(const HomeState.view());
  }

  /// Обновление списка найденных устройств
  void _updateDiscoveredDevices(List<Device> devices) {
    print(
      '[DEBUG] _updateDiscoveredDevices вызван с ${devices.length} устройствами',
    );

    if (isClosed) {
      print('[DEBUG] BLoC закрыт, обновление отменено');
      return;
    }

    _devices = devices;
    print(
      '[DEBUG] Список устройств обновлен, всего устройств: ${_devices.length}',
    );

    final currentState = state;
    print('[DEBUG] Текущее состояние: ${currentState.runtimeType}');

    if (currentState is HomeStateSearchingDevices) {
      print('[DEBUG] Эмитим событие onViewStateChanged для обновления списка');
      // Обновляем состояние поиска с новым списком устройств
      add(const HomeEvent.onViewStateChanged());
    }
  }

  /// Обработка входящих данных
  void _handleIncomingMessage(Message message) {
    if (isClosed) return;

    print('[DEBUG] Получено входящее сообщение: ${message.runtimeType}');

    // Проверяем текущее состояние
    final currentState = state;
    print(
      '[DEBUG] Текущее состояние при получении сообщения: ${currentState.runtimeType}',
    );

    switch (message) {
      case InvitationMessage(:final user):
        print('[DEBUG] Получено приглашение от пользователя: ${user.name}');
        // Если мы сервер в режиме ожидания, автоматически отправляем подтверждение
        if (currentState is HomeStateAwaitingConnection) {
          print(
            '[DEBUG] Сервер получил приглашение, отправляем подтверждение...',
          );
          add(const HomeEvent.onAcceptInvitation());
        } else {
          add(HomeEvent.onInvitationReceived(invitingUser: user));
        }
      case AcceptanceMessage(:final user):
        print('[DEBUG] Получено подтверждение от пользователя: ${user.name}');
        final currentState = state;
        if (currentState is HomeStateInvitationPending) {
          // Мы пригласили → мы X. Унифицируем запуск через событие
          add(HomeEvent.onGameStarted(opponent: user));
        } else if (currentState is HomeStateAwaitingConnection) {
          // Сервер получил подтверждение подключения от клиента
          print(
            '[DEBUG] Сервер получил подтверждение подключения, переход к тестированию сообщений',
          );
          add(const HomeEvent.onNavigateToMessageTest());
        } else {
          // Для тестирования сообщений
          add(HomeEvent.onMessageReceived(message: message));
        }
      case RejectionMessage(:final user):
        print('[DEBUG] Получен отказ от пользователя: ${user.name}');
        final currentState = state;
        if (currentState is HomeStateInvitationPending) {
          add(HomeEvent.onInvitationRejected(rejectedUser: user));
        } else {
          // Для тестирования сообщений
          add(HomeEvent.onMessageReceived(message: message));
        }
      case TerminationMessage():
        print('[DEBUG] Получено сообщение о завершении соединения');
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
        print('[DEBUG] Получено игровое сообщение (игнорируется в HomeBloc)');
        break;
      case RoleAssignmentMessage():
        // Пробрасывается в GameBloc через аргументы route (см. game_screen)
        // Здесь можно сохранить в локальный стейт при надобности
        print('[DEBUG] Получено сообщение о назначении роли');
        break;
      case OpponentLeftMessage():
        print('[DEBUG] Соперник покинул игру');
        final currentState = state;
        if (currentState is HomeStateAwaitingConnection ||
            currentState is HomeStateSearchingDevices) {
          add(const HomeEvent.onViewStateChanged());
        } else {
          // Для тестирования сообщений
          add(HomeEvent.onMessageReceived(message: message));
        }
      default:
        print('[DEBUG] Получено неизвестное сообщение: ${message.runtimeType}');
        // Для тестирования сообщений
        add(HomeEvent.onMessageReceived(message: message));
    }
  }

  /// Обработка подключений клиентов (для сервера)
  void _handleClientConnection(String clientId) {
    if (isClosed) return;

    print('[DEBUG] Обработка подключения клиента: $clientId');

    // Проверяем текущее состояние
    final currentState = state;
    print(
      '[DEBUG] Текущее состояние при подключении клиента: ${currentState.runtimeType}',
    );

    // Если мы в режиме ожидания подключения, отправляем приглашение
    if (currentState is HomeStateAwaitingConnection) {
      print(
        '[DEBUG] Сервер в режиме ожидания, отправляем приглашение клиенту: $clientId',
      );

      // Создаем временного пользователя, если он не установлен
      final currentUser =
          _currentUser ?? User(id: 'server_user', name: 'Сервер');

      // Создаем и отправляем приглашение
      final invitationMessage = InvitationMessage(
        device: Device(id: clientId, name: 'Клиент', isOurApp: true),
        user: currentUser,
      );

      // Отправляем приглашение подключившемуся клиенту
      _bluetoothRepository
          .sendMessage(invitationMessage)
          .then((_) {
            print('[DEBUG] Приглашение успешно отправлено клиенту: $clientId');
          })
          .catchError((error) {
            print(
              '[ERROR] Ошибка отправки приглашения клиенту $clientId: $error',
            );
          });
    } else {
      print(
        '[DEBUG] Сервер не в режиме ожидания, игнорируем подключение клиента: $clientId',
      );
    }
  }
}
