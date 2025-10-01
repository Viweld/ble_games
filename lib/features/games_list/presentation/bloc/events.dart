part of 'games_list_bloc.dart';

/// События экрана списка игр
@freezed
abstract class GamesListEvent with _$GamesListEvent {
  /// Запрос инициализации
  const factory GamesListEvent.onInitializationRequested() =
      GamesListEventOnInitializationRequested;

  /// Выбор игры
  const factory GamesListEvent.onGameSelected({required Game game}) =
      GamesListEventOnGameSelected;

  /// Запуск игры
  const factory GamesListEvent.onGameStart() = GamesListEventOnGameStart;

  /// Возврат назад
  const factory GamesListEvent.onBackPressed() = GamesListEventOnBackPressed;
}
