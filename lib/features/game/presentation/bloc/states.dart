part of 'game_bloc.dart';

/// Состояния игры
@freezed
class GameState with _$GameState {
  /// Состояние инициализации
  const factory GameState.initializationPending() =
      GameStateInitializationPending;

  /// Ошибка инициализации
  const factory GameState.initializationError({required String message}) =
      GameStateInitializationError;

  /// Основное состояние игры
  const factory GameState.view({
    required List<List<PlayerType?>> gameBoard,
    required PlayerType currentPlayer,
    required PlayerType playerType,
    required GameWinner gameWinner,
  }) = GameStateView;

  /// Потеря соединения
  const factory GameState.connectionLost() = GameStateConnectionLost;

  /// Соперник покинул игру
  const factory GameState.opponentLeft() = GameStateOpponentLeft;
}
