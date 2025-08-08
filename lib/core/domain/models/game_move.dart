import 'enums/player_type.dart';
import 'game_position.dart';

/// Ход в игре
class GameMove {
  const GameMove({
    required this.position,
    required this.playerType,
  });

  final GamePosition position;
  final PlayerType playerType;

  Map<String, dynamic> toJson() => {
    'row': position.row,
    'column': position.column,
    'playerType': playerType.name,
  };

  factory GameMove.fromJson(Map<String, dynamic> json) => GameMove(
    position: GamePosition(
      row: json['row'] as int,
      column: json['column'] as int,
    ),
    playerType: PlayerType.values.firstWhere(
          (e) => e.name == json['playerType'],
    ),
  );
}