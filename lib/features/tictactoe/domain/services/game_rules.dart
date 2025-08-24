import '../models/enums/game_winner.dart';
import '../models/enums/player_type.dart';

/// Правила игры и вычисление результата
class GameRules {
  const GameRules._();

  /// Определить победителя на текущем поле
  static GameWinner determineWinner(List<List<PlayerType?>> gameBoard) {
    // Строки
    for (int row = 0; row < 3; row++) {
      final a = gameBoard[row][0];
      final b = gameBoard[row][1];
      final c = gameBoard[row][2];
      if (a != null && a == b && b == c) {
        return a == PlayerType.x ? GameWinner.x : GameWinner.o;
      }
    }

    // Столбцы
    for (int col = 0; col < 3; col++) {
      final a = gameBoard[0][col];
      final b = gameBoard[1][col];
      final c = gameBoard[2][col];
      if (a != null && a == b && b == c) {
        return a == PlayerType.x ? GameWinner.x : GameWinner.o;
      }
    }

    // Диагонали
    final d1a = gameBoard[0][0];
    final d1b = gameBoard[1][1];
    final d1c = gameBoard[2][2];
    if (d1a != null && d1a == d1b && d1b == d1c) {
      return d1a == PlayerType.x ? GameWinner.x : GameWinner.o;
    }

    final d2a = gameBoard[0][2];
    final d2b = gameBoard[1][1];
    final d2c = gameBoard[2][0];
    if (d2a != null && d2a == d2b && d2b == d2c) {
      return d2a == PlayerType.x ? GameWinner.x : GameWinner.o;
    }

    // Ничья
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (gameBoard[i][j] == null) {
          return GameWinner.none;
        }
      }
    }

    return GameWinner.draw;
  }
}
