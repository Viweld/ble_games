import 'package:flutter/material.dart';

import '../../domain/models/enums/player_type.dart';

/// Виджет игрового поля
class GameBoard extends StatelessWidget {
  const GameBoard({
    super.key,
    required this.gameBoard,
    required this.onCellTap,
  });

  final List<List<PlayerType?>> gameBoard;
  final Function(int row, int column) onCellTap;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.outline,
            width: 2,
          ),
        ),
        child: Column(
          children: List.generate(3, (row) {
            return Expanded(
              child: Row(
                children: List.generate(3, (column) {
                  return Expanded(
                    child: _GameCell(
                      playerType: gameBoard[row][column],
                      onTap: () => onCellTap(row, column),
                    ),
                  );
                }),
              ),
            );
          }),
        ),
      ),
    );
  }
}

/// Виджет ячейки игрового поля
class _GameCell extends StatelessWidget {
  const _GameCell({required this.playerType, required this.onTap});

  final PlayerType? playerType;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.outline,
            width: 1,
          ),
        ),
        child: Center(child: _buildCellContent(context)),
      ),
    );
  }

  Widget _buildCellContent(BuildContext context) {
    if (playerType == null) {
      return const SizedBox.shrink();
    }

    if (playerType == PlayerType.x) {
      return Icon(
        Icons.close,
        size: 48,
        color: Theme.of(context).colorScheme.primary,
        weight: 900,
      );
    } else {
      return Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary,
            width: 3,
          ),
        ),
      );
    }
  }
}
