import 'package:bluetooth_toe/core/di/builders.dep_gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/extensions/build_context_extension.dart';
import '../../../core/domain/models/enums/game_winner.dart';
import '../../../core/domain/models/enums/player_type.dart';
import 'bloc/game_bloc.dart';
import 'widgets/game_board.dart';

/// Экран игры
class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DepProvider.of(context).buildGameBloc(),
      child: const _GameView(),
    );
  }
}

class _GameView extends StatelessWidget {
  const _GameView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Игра'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: BlocConsumer<GameBloc, GameState>(
        listener: (context, state) {
          state.when(
            initializationPending: () {},
            initializationError: (message) {
              context.showSnackBar('Ошибка: $message');
            },
            view: (gameBoard, currentPlayer, playerType, gameWinner) {
              if (gameWinner != GameWinner.none) {
                _showGameResultDialog(context, gameWinner, playerType);
              }
            },
            connectionLost: () {
              _showConnectionLostDialog(context);
            },
            opponentLeft: () {
              _showOpponentLeftDialog(context);
            },
          );
        },
        builder: (context, state) {
          return state.when(
            initializationPending: () =>
                const Center(child: CircularProgressIndicator()),
            initializationError: (message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Ошибка: $message'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Вернуться'),
                  ),
                ],
              ),
            ),
            view: (gameBoard, currentPlayer, playerType, gameWinner) => Column(
              children: [
                /// Уведомление о ходе
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    currentPlayer == playerType ? 'Ваш ход' : 'Ход соперника',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: AppConstants.turnNotificationFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                /// Игровое поле
                Expanded(
                  child: Center(
                    child: GameBoard(
                      gameBoard: gameBoard,
                      onCellTap: (row, column) {
                        context.read<GameBloc>().add(
                          GameEvent.onCellTapped(row: row, column: column),
                        );
                      },
                    ),
                  ),
                ),

                /// Информация об игроке
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Вы играете ${playerType == PlayerType.x ? 'крестиками' : 'ноликами'}',
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            connectionLost: () => const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.wifi_off, size: 64, color: Colors.orange),
                  SizedBox(height: 16),
                  Text('Соединение прервалось'),
                ],
              ),
            ),
            opponentLeft: () => const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person_off, size: 64, color: Colors.red),
                  SizedBox(height: 16),
                  Text('Соперник прервал игру'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// Показать диалог результата игры
  void _showGameResultDialog(
    BuildContext context,
    GameWinner gameWinner,
    PlayerType playerType,
  ) {
    String message;
    if (gameWinner == GameWinner.draw) {
      message = 'Ничья';
    } else if (gameWinner.name == playerType.name) {
      message = 'Вы выиграли';
    } else {
      message = 'Вы проиграли';
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Результат игры'),
        content: Text(message),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // Закрыть диалог
              Navigator.of(context).pop(); // Вернуться на главный экран
            },
            child: const Text('Ок'),
          ),
        ],
      ),
    );
  }

  /// Показать диалог потери соединения
  void _showConnectionLostDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Ошибка'),
        content: const Text('Соединение прервалось'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // Закрыть диалог
              Navigator.of(context).pop(); // Вернуться на главный экран
            },
            child: const Text('Ок'),
          ),
        ],
      ),
    );
  }

  /// Показать диалог выхода соперника
  void _showOpponentLeftDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Игра прервана'),
        content: const Text('Соперник прервал игру'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // Закрыть диалог
              Navigator.of(context).pop(); // Вернуться на главный экран
            },
            child: const Text('Ок'),
          ),
        ],
      ),
    );
  }
}
