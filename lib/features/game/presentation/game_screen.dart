import 'package:bluetooth_toe/core/di/builders.dep_gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/extensions/build_context_extension.dart';
import '../../game/domain/models/enums/game_winner.dart';
import '../../game/domain/models/enums/player_type.dart';
import 'bloc/game_bloc.dart';
import 'widgets/game_board.dart';

/// Экран игры
class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    final initialType = args is PlayerType ? args : null;
    return BlocProvider(
      create: (context) {
        final bloc = context.depGen().buildGameBloc();
        if (initialType != null) {
          bloc.add(GameEvent.onRoleAssigned(myPlayerType: initialType));
        }
        return bloc;
      },
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
        listenWhen: (previous, state) => switch (state) {
          GameStateInitializationError() => true,
          GameStateView(:final gameWinner) => gameWinner != GameWinner.none,
          GameStateConnectionLost() => true,
          GameStateOpponentLeft() => true,
          _ => false,
        },
        buildWhen: (previous, state) => switch (state) {
          GameStateInitializationPending() => true,
          GameStateInitializationError() => true,
          GameStateView() => true,
          GameStateConnectionLost() => true,
          GameStateOpponentLeft() => true,
          _ => false,
        },
        listener: (context, state) => switch (state) {
          GameStateInitializationError(:final message) => context.showSnackBar(
            'Ошибка: $message',
          ),
          GameStateView(:final gameWinner, :final playerType) =>
            gameWinner != GameWinner.none
                ? _showGameResultDialog(context, gameWinner, playerType)
                : null,
          GameStateConnectionLost() => _showOpponentLeftDialog(context),
          GameStateOpponentLeft() => _showOpponentLeftDialog(context),
          _ => null,
        },
        builder: (context, state) {
          return switch (state) {
            GameStateInitializationPending() => const Center(
              child: CircularProgressIndicator(),
            ),
            GameStateInitializationError(:final message) => Center(
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
            GameStateView(
              :final gameBoard,
              :final currentPlayer,
              :final playerType,
            ) =>
              Column(
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
            _ => throw UnsupportedError('${state.runtimeType} нельзя строить'),
          };
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
