part of 'game_bloc.dart';

/// События игры
@freezed
abstract class GameEvent with _$GameEvent {
  /// Запрос инициализации
  const factory GameEvent.onInitializationRequested() =
      GameEventOnInitializationRequested;

  /// Нажатие на ячейку
  const factory GameEvent.onCellTapped({
    required int row,
    required int column,
  }) = GameEventOnCellTapped;

  /// Входящее сообщение о ходе соперника
  const factory GameEvent.onIncomingMove({
    required int row,
    required int column,
    required PlayerType playerType,
  }) = GameEventOnIncomingMove;

  /// Потеря соединения
  const factory GameEvent.onConnectionLost() = GameEventOnConnectionLost;

  /// Назначение роли текущему игроку (X или O)
  const factory GameEvent.onRoleAssigned({required PlayerType myPlayerType}) =
      GameEventOnRoleAssigned;
}
