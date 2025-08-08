import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dep_gen/dep_gen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/models/enums/game_winner.dart';
import '../../../../core/domain/models/enums/player_type.dart';
import '../../../../core/repositories/i_bluetooth_repository.dart';

part 'events.dart';

part 'states.dart';

part 'game_bloc.freezed.dart';

/// BLoC для игры
@DepGen()
class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc({@DepArg() required IBluetoothRepository bluetoothRepository})
    : _bluetoothRepository = bluetoothRepository,
      super(const GameState.initializationPending()) {
    on<GameEvent>(
      (event, emit) => switch (event) {
        GameEventOnInitializationRequested() => _onInitializationRequested(
          emit,
        ),
        GameEventOnCellTapped() => _onCellTapped(event, emit),
        _ => throw UnimplementedError('Unhandled event: $event'),
      },
    );

    // Подписка на входящие данные
    _incomingDataSubscription = _bluetoothRepository.incomingData.listen(
      (data) => _handleIncomingData(data),
    );

    add(const GameEvent.onInitializationRequested());
  }

  final IBluetoothRepository _bluetoothRepository;

  late final StreamSubscription<Map<String, dynamic>> _incomingDataSubscription;

  List<List<PlayerType?>> _gameBoard = List.generate(
    3,
    (_) => List.filled(3, null),
  );
  PlayerType _currentPlayer = PlayerType.x;
  PlayerType _playerType = PlayerType.x;
  GameWinner _gameWinner = GameWinner.none;
  GameStateView? _viewState;

  @override
  Future<void> close() {
    _incomingDataSubscription.cancel();
    return super.close();
  }

  /// Обработчик запроса инициализации
  Future<void> _onInitializationRequested(Emitter<GameState> emit) async {
    try {
      // Случайно выбираем первого игрока
      _currentPlayer = PlayerType.values[DateTime.now().millisecond % 2];
      _playerType = _currentPlayer;

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
      _gameWinner = _checkWinner();

      // Отправляем ход сопернику
      await _bluetoothRepository.sendData({
        'type': 'move',
        'row': event.row,
        'column': event.column,
        'playerType': _currentPlayer.name,
      });

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

  /// Обработка входящих данных
  void _handleIncomingData(Map<String, dynamic> data) {
    final type = data['type'] as String?;

    switch (type) {
      case 'move':
        final row = data['row'] as int;
        final column = data['column'] as int;
        final playerTypeName = data['playerType'] as String;
        final playerType = PlayerType.values.firstWhere(
          (e) => e.name == playerTypeName,
        );

        // Делаем ход соперника
        _gameBoard[row][column] = playerType;

        // Проверяем победу
        _gameWinner = _checkWinner();

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
        break;
      case 'disconnect':
        emit(const GameState.connectionLost());
        break;
      case 'opponent_left':
        emit(const GameState.opponentLeft());
        break;
    }
  }

  /// Проверка победителя
  GameWinner _checkWinner() {
    // Проверяем строки
    for (int i = 0; i < 3; i++) {
      if (_gameBoard[i][0] != null &&
          _gameBoard[i][0] == _gameBoard[i][1] &&
          _gameBoard[i][1] == _gameBoard[i][2]) {
        return _gameBoard[i][0] == PlayerType.x ? GameWinner.x : GameWinner.o;
      }
    }

    // Проверяем столбцы
    for (int i = 0; i < 3; i++) {
      if (_gameBoard[0][i] != null &&
          _gameBoard[0][i] == _gameBoard[1][i] &&
          _gameBoard[1][i] == _gameBoard[2][i]) {
        return _gameBoard[0][i] == PlayerType.x ? GameWinner.x : GameWinner.o;
      }
    }

    // Проверяем диагонали
    if (_gameBoard[0][0] != null &&
        _gameBoard[0][0] == _gameBoard[1][1] &&
        _gameBoard[1][1] == _gameBoard[2][2]) {
      return _gameBoard[0][0] == PlayerType.x ? GameWinner.x : GameWinner.o;
    }

    if (_gameBoard[0][2] != null &&
        _gameBoard[0][2] == _gameBoard[1][1] &&
        _gameBoard[1][1] == _gameBoard[2][0]) {
      return _gameBoard[0][2] == PlayerType.x ? GameWinner.x : GameWinner.o;
    }

    // Проверяем ничью
    bool isBoardFull = true;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (_gameBoard[i][j] == null) {
          isBoardFull = false;
          break;
        }
      }
    }

    return isBoardFull ? GameWinner.draw : GameWinner.none;
  }
}
