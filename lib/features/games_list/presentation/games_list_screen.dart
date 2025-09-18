import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/builders.dep_gen.dart';
import '../../../core/extensions/build_context_extension.dart';
import '../domain/models/game.dart';
import 'bloc/games_list_bloc.dart';

/// Экран выбора игр
class GamesListScreen extends StatelessWidget {
  const GamesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DepProvider.of(context).buildGamesListBloc(),
      child: const _GamesListView(),
    );
  }
}

class _GamesListView extends StatelessWidget {
  const _GamesListView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Выберите игру'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => _onBackPressed(context),
        ),
      ),
      body: BlocConsumer<GamesListBloc, GamesListState>(
        listenWhen: (_, state) => switch (state) {
          GamesListStateInitializationError() => true,
          GamesListStateGameStarting() => true,
          _ => false,
        },
        buildWhen: (_, state) => switch (state) {
          GamesListStateInitializationPending() => true,
          GamesListStateInitializationError() => true,
          GamesListStateView() => true,
          _ => false,
        },
        listener: (context, state) => switch (state) {
          GamesListStateInitializationError(:final message) =>
            _initializationError(context, message),
          GamesListStateGameStarting(:final game) => _gameStarting(
            context,
            game,
          ),
          _ => null,
        },
        builder: (context, state) => switch (state) {
          GamesListStateInitializationPending() => const Center(
            child: CircularProgressIndicator(),
          ),
          GamesListStateInitializationError(:final message) => _ErrorView(
            message: message,
            onRetry: () => _onRetry(context),
          ),
          GamesListStateView(:final games, :final selectedGame) => _MainView(
            games: games,
            selectedGame: selectedGame,
            onGameSelected: (game) => _onGameSelected(context, game),
            onGameStart: () => _onGameStart(context),
          ),
          _ => throw UnsupportedError(
            'Неподдерживаемое состояние: ${state.runtimeType}',
          ),
        },
      ),
    );
  }

  /// Обработчик нажатия кнопки назад
  void _onBackPressed(BuildContext context) {
    Navigator.of(context).pop();
  }

  /// Обработчик ошибки инициализации
  void _initializationError(BuildContext context, String message) {
    context.showSnackBar('Ошибка: $message');
  }

  /// Обработчик запуска игры
  void _gameStarting(BuildContext context, Game game) {
    Navigator.of(context).pushNamed(game.routeName);
  }

  /// Обработчик повтора инициализации
  void _onRetry(BuildContext context) {
    context.read<GamesListBloc>().add(
      const GamesListEvent.onInitializationRequested(),
    );
  }

  /// Обработчик выбора игры
  void _onGameSelected(BuildContext context, Game game) {
    context.read<GamesListBloc>().add(
      GamesListEvent.onGameSelected(game: game),
    );
  }

  /// Обработчик запуска игры
  void _onGameStart(BuildContext context) {
    context.read<GamesListBloc>().add(const GamesListEvent.onGameStart());
  }
}

/// Виджет отображения ошибки
class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message, required this.onRetry});

  /// Сообщение об ошибке
  final String message;

  /// Коллбэк повтора
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error, size: 64, color: Colors.red),
          const SizedBox(height: 16),
          Text('Ошибка: $message'),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: onRetry, child: const Text('Повторить')),
        ],
      ),
    );
  }
}

/// Основной виджет со списком игр
class _MainView extends StatelessWidget {
  const _MainView({
    required this.games,
    required this.selectedGame,
    required this.onGameSelected,
    required this.onGameStart,
  });

  /// Список игр
  final List<Game> games;

  /// Выбранная игра
  final Game? selectedGame;

  /// Коллбэк выбора игры
  final ValueChanged<Game> onGameSelected;

  /// Коллбэк запуска игры
  final VoidCallback onGameStart;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Список игр
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: games.length,
            itemBuilder: (context, index) {
              final game = games[index];
              final isSelected = selectedGame?.id == game.id;

              return _GameListItem(
                game: game,
                isSelected: isSelected,
                onTap: () => onGameSelected(game),
              );
            },
          ),
        ),

        /// Кнопка запуска игры
        Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: selectedGame != null ? onGameStart : null,
              child: const Text('Начать игру'),
            ),
          ),
        ),
      ],
    );
  }
}

/// Элемент списка игр
class _GameListItem extends StatelessWidget {
  const _GameListItem({
    required this.game,
    required this.isSelected,
    required this.onTap,
  });

  /// Игра
  final Game game;

  /// Выбрана ли игра
  final bool isSelected;

  /// Коллбэк нажатия
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      color: isSelected
          ? Theme.of(context).primaryColor.withValues(alpha: 0.1)
          : null,
      child: ListTile(
        leading: const Icon(Icons.games),
        title: Text(game.name),
        subtitle: Text(game.description),
        trailing: isSelected
            ? const Icon(Icons.check_circle, color: Colors.green)
            : null,
        onTap: onTap,
      ),
    );
  }
}
