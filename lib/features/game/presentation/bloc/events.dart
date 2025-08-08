part of 'game_bloc.dart';

/// События игры
@freezed
class GameEvent with _$GameEvent {
  /// Запрос инициализации
  const factory GameEvent.onInitializationRequested() =
      GameEventOnInitializationRequested;

  /// Нажатие на ячейку
  const factory GameEvent.onCellTapped({
    required int row,
    required int column,
  }) = GameEventOnCellTapped;
}
