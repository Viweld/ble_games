part of 'games_list_bloc.dart';

/// Состояния экрана списка игр
@freezed
class GamesListState with _$GamesListState {
  /// Состояние инициализации
  const factory GamesListState.initializationPending() =
      GamesListStateInitializationPending;

  /// Ошибка инициализации
  const factory GamesListState.initializationError({required String message}) =
      GamesListStateInitializationError;

  /// Основное состояние со списком игр
  const factory GamesListState.view({
    required List<Game> games,
    Game? selectedGame,
  }) = GamesListStateView;

  /// Состояние запуска игры
  const factory GamesListState.gameStarting({required Game game}) =
      GamesListStateGameStarting;
}
