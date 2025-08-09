import 'package:flutter/foundation.dart';

/// Позиция на поле
@immutable
class GamePosition {
  const GamePosition({required this.row, required this.column});

  final int row;
  final int column;
}
