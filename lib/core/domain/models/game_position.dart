/// Позиция на поле
class GamePosition {
  const GamePosition({
    required this.row,
    required this.column,
  });

  final int row;
  final int column;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GamePosition && other.row == row && other.column == column;
  }

  @override
  int get hashCode => row.hashCode ^ column.hashCode;

  @override
  String toString() => 'GamePosition(row: $row, column: $column)';
}
