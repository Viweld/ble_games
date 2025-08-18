import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dep_gen/dep_gen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/domain/models/device.dart';
import '../../../../core/domain/models/messages.dart';
import '../../../../core/domain/models/user.dart';
import '../../../../core/repositories/i_user_repository.dart';
import '../../../../core/repositories/i_nearby_connections_repository.dart';
import '../../../game/domain/models/enums/player_type.dart';

part 'events.dart';

part 'states.dart';

part 'home_bloc.freezed.dart';

/// BLoC для главного экрана
@DepGen()
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    @DepArg() required IUserRepository playerRepository,
    @DepArg() required INearbyConnectionsRepository nearbyRepository,
  }) : _playerRepository = playerRepository,
       _nearbyRepository = nearbyRepository,
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
        HomeEventOnSearchDevicesRequested() => _onSearchDevicesRequested(
          emitter,
        ),
        HomeEventOnStartAdvertisingRequested() => _onStartAdvertisingRequested(
          emitter,
        ),
        HomeEventOnDisconnectRequested() => _onDisconnectRequested(emitter),
        _ => throw UnimplementedError('Unhandled event: $event'),
      },
    );

    // Подписка на входящие данные
    _incomingDataSubscription = _nearbyRepository.incomingMessages.listen(
      _handleIncomingMessage,
    );

    add(const HomeEvent.onInitializationRequested());
  }

  final IUserRepository _playerRepository;
  final INearbyConnectionsRepository _nearbyRepository;

  late final StreamSubscription<Message> _incomingDataSubscription;

  List<Device> _devices = [];
  Device? _selectedDevice;
  User? _currentUser;
  HomeStateView? _viewState;

  @override
  Future<void> close() {
    _incomingDataSubscription.cancel();
    _nearbyRepository.dispose();
    return super.close();
  }

  /// Обработчик запроса инициализации
  Future<void> _onInitializationRequested(Emitter<HomeState> emitter) async {
    try {
      // Инициализация Nearby Connections
      await _nearbyRepository.initialize();

      // Получаем текущего игрока
      _currentUser = await _playerRepository.getCurrentUser();

      if (kDebugMode) {
        print('Получен пользователь: ${_currentUser?.name ?? "null"}');
      }

      // Проверяем, является ли это первым запуском
      final isFirstLaunch = await _playerRepository.isFirstLaunch();

      if (kDebugMode) {
        print('Первый запуск: $isFirstLaunch');
      }

      // Если это первый запуск и пользователь не создан, создаем его автоматически
      if (isFirstLaunch && _currentUser == null) {
        _currentUser = User(
          id: 'local_user_${DateTime.now().millisecondsSinceEpoch}',
          name: 'Игрок ${DateTime.now().millisecondsSinceEpoch % 1000}',
        );
        await _playerRepository.saveCurrentUser(_currentUser!);
        await _playerRepository.setFirstLaunch(false);

        if (kDebugMode) {
          print('Автоматически создан пользователь: ${_currentUser!.name}');
        }
      }

      _viewState = HomeStateView(
        devices: _devices,
        selectedDevice: _selectedDevice,
        isFirstLaunch: false,
        isConnected: false,
      );
      emitter(_viewState!);
    } catch (e) {
      emitter(HomeState.initializationError(message: e.toString()));
    }
  }

  /// Обработчик ручного обновления
  Future<void> _onRefreshRequested(Emitter<HomeState> emitter) async {
    try {
      await _nearbyRepository.stopDiscovery();
      await _nearbyRepository.startDiscovery();
    } catch (e) {
      emitter(HomeState.initializationError(message: 'Ошибка обновления: $e'));
    }
  }

  /// Обработчик поиска устройств
  Future<void> _onSearchDevicesRequested(Emitter<HomeState> emitter) async {
    try {
      await _nearbyRepository.startDiscovery();
      // В реальном приложении здесь будет логика обработки найденных устройств
    } catch (e) {
      emitter(HomeState.initializationError(message: 'Ошибка поиска: $e'));
    }
  }

  /// Обработчик начала рекламы
  Future<void> _onStartAdvertisingRequested(Emitter<HomeState> emitter) async {
    try {
      await _nearbyRepository.startAdvertising();
    } catch (e) {
      emitter(HomeState.initializationError(message: 'Ошибка рекламы: $e'));
    }
  }

  /// Обработчик отключения
  Future<void> _onDisconnectRequested(Emitter<HomeState> emitter) async {
    try {
      await _nearbyRepository.disconnect();
      if (_viewState != null) {
        _viewState = _viewState!.copyWith(isConnected: false);
        emitter(_viewState!);
      }
    } catch (e) {
      emitter(HomeState.initializationError(message: 'Ошибка отключения: $e'));
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
      // Проверяем и создаем пользователя если нужно
      if (_currentUser == null) {
        // Попробуем получить пользователя из репозитория
        _currentUser = await _playerRepository.getCurrentUser();

        // Если все еще нет, создаем нового
        if (_currentUser == null) {
          _currentUser = User(
            id: 'local_user_${DateTime.now().millisecondsSinceEpoch}',
            name: 'Игрок ${DateTime.now().millisecondsSinceEpoch % 1000}',
          );
          await _playerRepository.saveCurrentUser(_currentUser!);

          if (kDebugMode) {
            print('Создан пользователь в _onInvite: ${_currentUser!.name}');
          }
        }
      }

      // Приглашаем пользователя: в нашей модели отправляем InvitationMessage
      final connected = _nearbyRepository.connectedDevice;
      if (connected == null) {
        if (_selectedDevice == null) {
          throw StateError('Устройство не выбрано');
        }
        await _nearbyRepository.connectToDevice(_selectedDevice!);
      }

      await _nearbyRepository.sendMessage(
        InvitationMessage(
          device: _nearbyRepository.connectedDevice ?? _selectedDevice!,
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
      // Проверяем пользователя
      if (_currentUser == null) {
        _currentUser = await _playerRepository.getCurrentUser();
        if (_currentUser == null) {
          throw StateError('Пользователь не инициализирован');
        }
      }

      final device = _nearbyRepository.connectedDevice;
      if (device == null) {
        throw StateError('Нет активного соединения');
      }

      await _nearbyRepository.sendMessage(
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
      // Проверяем пользователя
      if (_currentUser == null) {
        _currentUser = await _playerRepository.getCurrentUser();
        if (_currentUser == null) {
          throw StateError('Пользователь не инициализирован');
        }
      }

      final device = _nearbyRepository.connectedDevice;
      if (device == null) {
        throw StateError('Нет активного соединения');
      }

      // Приглашённый получает O. Удалённой стороне (пригласившему) назначаем X
      await _nearbyRepository.sendMessage(
        RoleAssignmentMessage(
          device: device,
          user: _currentUser!,
          assignedType: PlayerType.x,
        ),
      );

      await _nearbyRepository.sendMessage(
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
      // Проверяем пользователя
      if (_currentUser == null) {
        _currentUser = await _playerRepository.getCurrentUser();
        if (_currentUser == null) {
          throw StateError('Пользователь не инициализирован');
        }
      }

      final device = _nearbyRepository.connectedDevice;
      if (device == null) {
        throw StateError('Нет активного соединения');
      }

      await _nearbyRepository.sendMessage(
        RejectionMessage(device: device, user: _currentUser!),
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

  /// Обработка входящих данных
  void _handleIncomingMessage(Message message) {
    if (isClosed) return;

    if (kDebugMode) {
      print(
        '[MESSAGE] Получено сообщение: ${message.runtimeType} от ${message.user.name}',
      );
    }

    switch (message) {
      case InvitationMessage(:final user):
        if (kDebugMode) {
          print('[MESSAGE] Обрабатываем приглашение от: ${user.name}');
        }
        add(HomeEvent.onInvitationReceived(invitingUser: user));
      case AcceptanceMessage(:final user):
        if (kDebugMode) {
          print('[MESSAGE] Обрабатываем принятие от: ${user.name}');
        }
        final currentState = state;
        if (currentState is HomeStateInvitationPending) {
          // Мы пригласили → мы X. Унифицируем запуск через событие
          add(HomeEvent.onGameStarted(opponent: user));
        }
      case RejectionMessage(:final user):
        if (kDebugMode) {
          print('[MESSAGE] Обрабатываем отказ от: ${user.name}');
        }
        final currentState = state;
        if (currentState is HomeStateInvitationPending) {
          add(HomeEvent.onInvitationRejected(rejectedUser: user));
        }
      case TerminationMessage():
        if (kDebugMode) {
          print('[MESSAGE] Обрабатываем завершение соединения');
        }
        if (_viewState != null) {
          _viewState = _viewState!.copyWith(isConnected: false);
          add(const HomeEvent.onViewStateChanged());
        }
      case OpponentLeftMessage():
        if (kDebugMode) {
          print('[MESSAGE] Обрабатываем выход соперника');
        }
        if (_viewState != null) {
          _viewState = _viewState!.copyWith(isConnected: false);
          add(const HomeEvent.onViewStateChanged());
        }
      case RoleAssignmentMessage():
        if (kDebugMode) {
          print('[MESSAGE] Обрабатываем назначение роли');
        }
        // Пробрасывается в GameBloc через аргументы route (см. game_screen)
        // Здесь можно сохранить в локальный стейт при надобности
        break;
      case MoveMessage():
        if (kDebugMode) {
          print('[MESSAGE] Обрабатываем ход в игре');
        }
        // Игровые сообщения обрабатываются GameBloc, игнорируем здесь
        break;
    }
  }
}
