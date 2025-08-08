import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dep_gen/dep_gen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/models/player.dart';
import '../../../../core/repositories/i_player_repository.dart';
import '../../../../core/repositories/i_bluetooth_repository.dart';

part 'events.dart';

part 'states.dart';

part 'home_bloc.freezed.dart';

/// BLoC для главного экрана
@DepGen()
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    @DepArg() required IPlayerRepository playerRepository,
    @DepArg() required IBluetoothRepository bluetoothRepository,
  }) : _playerRepository = playerRepository,
       _bluetoothRepository = bluetoothRepository,
       super(const HomeState.initializationPending()) {
    on<HomeEvent>(
      (event, emitter) => switch (event) {
        HomeEventOnInitializationRequested() => _onInitializationRequested(
          emitter,
        ),
        HomeEventOnPlayerSelected() => _onPlayerSelected(event, emitter),
        HomeEventOnInvitePlayer() => _onInvitePlayer(event, emitter),
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
    _incomingDataSubscription = _bluetoothRepository.incomingData.listen(
      _handleIncomingData,
    );

    add(const HomeEvent.onInitializationRequested());
  }

  final IPlayerRepository _playerRepository;
  final IBluetoothRepository _bluetoothRepository;

  late final StreamSubscription<List<Player>> _discoveredDevicesSubscription;
  late final StreamSubscription<Map<String, dynamic>> _incomingDataSubscription;

  List<Player> _discoveredDevices = [];
  Player? _selectedPlayer;
  Player? _currentPlayer;
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
      _currentPlayer = await _playerRepository.getCurrentPlayer();

      // Проверяем, является ли это первым запуском
      final isFirstLaunch = await _playerRepository.isFirstLaunch();

      // Начинаем поиск устройств
      await _bluetoothRepository.startDiscovery();

      _viewState = HomeStateView(
        players: _discoveredDevices,
        selectedPlayer: _selectedPlayer,
        isFirstLaunch: isFirstLaunch,
      );
      emitter(_viewState!);
    } catch (e) {
      emitter(HomeState.initializationError(message: e.toString()));
    }
  }

  /// Обработчик выбора игрока
  Future<void> _onPlayerSelected(
    HomeEventOnPlayerSelected event,
    Emitter<HomeState> emitter,
  ) async {
    _selectedPlayer = event.player;

    if (_viewState != null) {
      _viewState = _viewState!.copyWith(selectedPlayer: _selectedPlayer);
      emitter(_viewState!);
    }
  }

  /// Обработчик приглашения игрока
  Future<void> _onInvitePlayer(
    HomeEventOnInvitePlayer event,
    Emitter<HomeState> emitter,
  ) async {
    try {
      // Отправляем приглашение
      await _bluetoothRepository.sendData({
        'type': 'invitation',
        'from': _currentPlayer?.toJson(),
        'to': event.player.toJson(),
      });

      emitter(HomeState.invitationPending(invitedPlayer: event.player));
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
      await _bluetoothRepository.sendData({'type': 'cancel_invitation'});

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
      await _bluetoothRepository.sendData({'type': 'accept_invitation'});

      // Переходим к игре
      final currentState = state;
      if (currentState is HomeStateInvitationReceived) {
        emitter(HomeState.gameStarted(opponent: currentState.invitingPlayer));
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
      await _bluetoothRepository.sendData({'type': 'reject_invitation'});

      final currentState = state;
      if (currentState is HomeStateInvitationReceived) {
        emitter(
          HomeState.invitationRejected(
            rejectedPlayer: currentState.invitingPlayer,
          ),
        );
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
      // Создаем игрока с новым псевдонимом
      final player = Player(
        id: 'local_player',
        nickname: event.nickname,
        deviceId: 'local_device',
        deviceName: 'Local Device',
      );

      // Сохраняем игрока
      await _playerRepository.saveCurrentPlayer(player);
      _currentPlayer = player;

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
    emitter(HomeState.invitationReceived(invitingPlayer: event.invitingPlayer));
  }

  /// Обработчик отклонения приглашения
  void _onInvitationRejected(
    HomeEventOnInvitationRejected event,
    Emitter<HomeState> emitter,
  ) {
    emitter(HomeState.invitationRejected(rejectedPlayer: event.rejectedPlayer));
  }

  /// Обработчик начала игры
  void _onGameStarted(
    HomeEventOnGameStarted event,
    Emitter<HomeState> emitter,
  ) {
    emitter(HomeState.gameStarted(opponent: event.opponent));
  }

  /// Обновление списка найденных устройств
  void _updateDiscoveredDevices(List<Player> devices) {
    if (isClosed) return;
    _discoveredDevices = devices;

    if (_viewState == null) return;
    _viewState = _viewState!.copyWith(players: _discoveredDevices);
    add(const HomeEvent.onViewStateChanged());
  }

  /// Обработка входящих данных
  void _handleIncomingData(Map<String, dynamic> data) {
    if (isClosed) return;
    final type = data['type'] as String?;

    switch (type) {
      case 'invitation':
        final fromPlayer = Player.fromJson(
          data['from'] as Map<String, dynamic>,
        );
        add(HomeEvent.onInvitationReceived(invitingPlayer: fromPlayer));
        break;
      case 'accept_invitation':
        final currentState = state;
        if (currentState is HomeStateInvitationPending) {
          add(HomeEvent.onGameStarted(opponent: currentState.invitedPlayer));
        }
        break;
      case 'reject_invitation':
        final currentState = state;
        if (currentState is HomeStateInvitationPending) {
          add(
            HomeEvent.onInvitationRejected(
              rejectedPlayer: currentState.invitedPlayer,
            ),
          );
        }
        break;
      case 'cancel_invitation':
        if (_viewState == null) break;
        if (isClosed) break;
        add(const HomeEvent.onViewStateChanged());
        break;
    }
  }
}
