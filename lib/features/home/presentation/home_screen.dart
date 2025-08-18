import 'package:bluetooth_toe/core/di/builders.dep_gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/models/device.dart';
import '../../../../core/domain/models/user.dart';
import '../../../../core/domain/models/game.dart';
import '../../../../core/extensions/build_context_extension.dart';
import 'bloc/home_bloc.dart';
import 'widgets/connection_manager.dart';
import 'widgets/games_list.dart';

/// Главный экран приложения
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.depGen().buildHomeBloc(),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Крестики-Нолики'), centerTitle: true),
      body: BlocConsumer<HomeBloc, HomeState>(
        listenWhen: (previous, state) => switch (state) {
          HomeStateInitializationError() => true,
          HomeStateInvitationPending() => true,
          HomeStateInvitationReceived() => true,
          HomeStateInvitationRejected() => true,
          HomeStateGameStarted() => true,
          _ => false,
        },
        buildWhen: (previous, state) => switch (state) {
          HomeStateInitializationPending() => true,
          HomeStateInitializationError() => true,
          HomeStateView() => true,
          _ => false,
        },
        listener: (context, state) => switch (state) {
          HomeStateInitializationError(:final message) => context.showSnackBar(
            'Ошибка: $message',
          ),
          HomeStateInvitationPending(:final invitedDevice) =>
            _showWaitingDialog(context, invitedDevice).then((_) {
              if (context.mounted) {
                context.read<HomeBloc>().add(
                  const HomeEvent.onCancelInvitation(),
                );
              }
            }),
          HomeStateInvitationReceived(:final invitingUser) =>
            _showInvitationDialog(context, invitingUser).then((result) {
              if (context.mounted) {
                if (result == true) {
                  context.read<HomeBloc>().add(
                    const HomeEvent.onAcceptInvitation(),
                  );
                } else if (result == false) {
                  context.read<HomeBloc>().add(
                    const HomeEvent.onRejectInvitation(),
                  );
                }
              }
            }),
          HomeStateInvitationRejected(:final rejectedUser) =>
            _showRejectionDialog(context, rejectedUser),
          HomeStateGameStarted(:final myPlayerType) => Navigator.of(
            context,
          ).pushNamed('/game', arguments: myPlayerType),
          _ => null,
        },
        builder: (context, state) {
          return switch (state) {
            HomeStateInitializationPending() => const Center(
              child: CircularProgressIndicator(),
            ),
            HomeStateInitializationError(:final message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Ошибка: $message'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<HomeBloc>().add(
                        const HomeEvent.onInitializationRequested(),
                      );
                    },
                    child: const Text('Повторить'),
                  ),
                ],
              ),
            ),
            HomeStateView(
              :final devices,
              :final selectedDevice,
              :final isConnected,
            ) =>
              Column(
                children: [
                  /// Менеджер подключений
                  ConnectionManager(),

                  /// Список игр
                  Expanded(
                    child: GamesList(
                      games: _getAvailableGames(),
                      isConnected: isConnected,
                      onGameSelected: (game) => _onGameSelected(context, game),
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

  /// Получить список доступных игр
  List<Game> _getAvailableGames() {
    return [
      const Game(
        id: 'tic_tac_toe',
        name: 'Крестики-Нолики',
        description: 'Классическая игра для двух игроков',
        icon: '0xe3b2', // Icons.games
        isAvailable: true,
        route: '/game',
      ),
      // Здесь можно добавить другие игры в будущем
    ];
  }

  /// Обработка выбора игры
  void _onGameSelected(BuildContext context, Game game) {
    if (game.id == 'tic_tac_toe') {
      Navigator.of(context).pushNamed('/game');
    }
  }

  /// Показать диалог ожидания
  Future<void> _showWaitingDialog(
    BuildContext context,
    Device invitedDevice,
  ) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Ожидание'),
        content: Text(
          'Ожидайте когда устройство ${invitedDevice.name} ответит',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Отмена'),
          ),
        ],
      ),
    );
  }

  /// Показать диалог приглашения
  Future<bool?> _showInvitationDialog(
    BuildContext context,
    User invitingUser,
  ) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Приглашение'),
        content: Text('${invitingUser.name} пригласил вас поиграть'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('Отмена'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text('Начать'),
          ),
        ],
      ),
    );
  }

  /// Показать диалог отказа
  void _showRejectionDialog(BuildContext context, User rejectedUser) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Отказ'),
        content: Text('${rejectedUser.name} отказался играть'),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Ок'),
          ),
        ],
      ),
    );
  }
}
