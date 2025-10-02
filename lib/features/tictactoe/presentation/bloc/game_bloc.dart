import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dep_gen/dep_gen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/models/messages.dart';
import '../../../../core/domain/models/user.dart';
import '../../../../core/domain/services/bluetooth_manager/i_bluetooth_manager.dart';
import '../../../../core/domain/repositories/i_user_repository.dart';
import '../../domain/models/enums/game_winner.dart';
import '../../domain/models/enums/player_type.dart';
import '../../domain/models/game_move.dart';
import '../../domain/models/game_position.dart';
import '../../domain/services/game_rules.dart';

part 'events.dart';

part 'states.dart';

part 'game_bloc.freezed.dart';

/// BLoC для игры
@DepGen()
class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc({
    @DepArg() required IBluetoothManager bluetoothRepository,
    @DepArg() required IUserRepository userRepository,
  }) : _bluetoothRepository = bluetoothRepository,
       _userRepository = userRepository,
       super(const GameState.initializationPending()) {
    on<GameEvent>(
      (event, emit) => switch (event) {
        GameEventOnInitializationRequested() => _onInitializationRequested(
          emit,
        ),
        GameEventOnCellTapped() => _onCellTapped(event, emit),
        GameEventOnIncomingMove() => _onIncomingMove(event, emit),
        GameEventOnConnectionLost() => _onConnectionLost(emit),
        GameEventOnRoleAssigned() => _onRoleAssigned(event, emit),
        _ => throw UnimplementedError('Unhandled event: $event'),
      },
    );
    _gameBoard = List.generate(3, (_) => List.filled(3, null));

    // Подписка на входящие сообщения доменного уровня
    _incomingDataSubscription = _bluetoothRepository.incomingMessages.listen((
      message,
    ) {
      if (isClosed) return;
      switch (message) {
        case MoveMessage(:final move):
          add(
            GameEvent.onIncomingMove(
              row: move.position.row,
              column: move.position.column,
              playerType: move.playerType,
            ),
          );
        case TerminationMessage():
          add(const GameEvent.onConnectionLost());
        case OpponentLeftMessage():
          add(const GameEvent.onConnectionLost());
        default:
          break;
      }
    });

    add(const GameEvent.onInitializationRequested());
  }

  final IBluetoothManager _bluetoothRepository;
  final IUserRepository _userRepository;

  late final StreamSubscription<Message> _incomingDataSubscription;
  late final List<List<PlayerType?>> _gameBoard;
  PlayerType _currentPlayer = PlayerType.x;
  PlayerType _playerType = PlayerType.x;
  GameWinner _gameWinner = GameWinner.none;
  User? _currentUser;
  GameStateView? _viewState;

  @override
  Future<void> close() {
    _incomingDataSubscription.cancel();
    return super.close();
  }

  /// Обработчик запроса инициализации
  Future<void> _onInitializationRequested(Emitter<GameState> emit) async {
    try {
      // Загружаем текущего пользователя
      _currentUser = await _userRepository.getCurrentUser();
      // Роль назначается через RoleAssignmentMessage/аргументы экрана
      _currentPlayer = PlayerType.x;
      _playerType = PlayerType.x;

      _viewState = GameStateView(
        gameBoard: _gameBoard,
        currentPlayer: _currentPlayer,
        playerType: _playerType,
        gameWinner: _gameWinner,
      );
      emit(_viewState!);
    } catch (e) {
      emit(GameState.initializationError(message: e.toString()));
    }
  }

  /// Обработчик нажатия на ячейку
  Future<void> _onCellTapped(
    GameEventOnCellTapped event,
    Emitter<GameState> emit,
  ) async {
    try {
      // Проверяем, что это ход текущего игрока
      if (_currentPlayer != _playerType) {
        return;
      }

      // Проверяем, что ячейка свободна
      if (_gameBoard[event.row][event.column] != null) {
        return;
      }

      // Делаем ход
      _gameBoard[event.row][event.column] = _currentPlayer;

      // Проверяем победу
      _gameWinner = GameRules.determineWinner(_gameBoard);

      // Отправляем ход сопернику доменной моделью
      final device = _bluetoothRepository.connectedDevice;
      if (device != null && _currentUser != null) {
        await _bluetoothRepository.sendMessage(
          MoveMessage(
            device: device,
            user: _currentUser!,
            move: GameMove(
              position: GamePosition(row: event.row, column: event.column),
              playerType: _currentPlayer,
            ),
          ),
        );
      }

      // Обновляем состояние
      if (_viewState != null) {
        _viewState = _viewState!.copyWith(
          gameBoard: _gameBoard,
          gameWinner: _gameWinner,
        );
        emit(_viewState!);
      }

      // Если игра не закончена, меняем игрока
      if (_gameWinner == GameWinner.none) {
        _currentPlayer = _currentPlayer == PlayerType.x
            ? PlayerType.o
            : PlayerType.x;
        if (_viewState != null) {
          _viewState = _viewState!.copyWith(currentPlayer: _currentPlayer);
          emit(_viewState!);
        }
      }
    } catch (e) {
      emit(GameState.initializationError(message: 'Ошибка хода: $e'));
    }
  }

  /// Обработчик входящего хода (через событие)
  Future<void> _onIncomingMove(
    GameEventOnIncomingMove event,
    Emitter<GameState> emit,
  ) async {
    _gameBoard[event.row][event.column] = event.playerType;

    _gameWinner = GameRules.determineWinner(_gameBoard);

    if (_viewState != null) {
      _viewState = _viewState!.copyWith(
        gameBoard: _gameBoard,
        gameWinner: _gameWinner,
      );
      emit(_viewState!);
    }

    if (_gameWinner == GameWinner.none) {
      _currentPlayer = _currentPlayer == PlayerType.x
          ? PlayerType.o
          : PlayerType.x;
      if (_viewState != null) {
        _viewState = _viewState!.copyWith(currentPlayer: _currentPlayer);
        emit(_viewState!);
      }
    }
  }

  /// Обработчик потери соединения (через событие)
  void _onConnectionLost(Emitter<GameState> emit) {
    emit(const GameState.connectionLost());
  }

  Future<void> _onRoleAssigned(
    GameEventOnRoleAssigned event,
    Emitter<GameState> emit,
  ) async {
    _playerType = event.myPlayerType;
    _currentPlayer = _playerType;
    if (_viewState != null) {
      _viewState = _viewState!.copyWith(
        currentPlayer: _currentPlayer,
        playerType: _playerType,
      );
      emit(_viewState!);
    }
  }

  // Логика победителя вынесена в GameRules.determineWinner
}
