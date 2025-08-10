import 'package:flutter/foundation.dart';

import 'enums/player_type.dart';
import 'game_position.dart';

/// Ход в игре
@immutable
class GameMove {
  const GameMove({required this.position, required this.playerType});

  final GamePosition position;
  final PlayerType playerType;
}
