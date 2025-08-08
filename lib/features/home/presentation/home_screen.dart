import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/models/player.dart';
import '../../../../core/extensions/build_context_extension.dart';
import '../../../core/di/builders.dep_gen.dart';
import 'bloc/home_bloc.dart';
import 'widgets/nickname_dialog/nickname_dialog.dart';
import 'widgets/player_list_item.dart';

/// Главный экран приложения
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DepProvider.of(context).buildHomeBloc(),
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
        listener: (context, state) {
          state.when(
            initializationPending: () {},
            initializationError: (message) {
              context.showSnackBar('Ошибка: $message');
            },
            view: (players, selectedPlayer, isFirstLaunch) {
              if (isFirstLaunch) {
                _showNicknameDialog(context);
              }
            },
            invitationPending: (invitedPlayer) {
              _showWaitingDialog(context, invitedPlayer);
            },
            invitationReceived: (invitingPlayer) {
              _showInvitationDialog(context, invitingPlayer);
            },
            invitationRejected: (rejectedPlayer) {
              _showRejectionDialog(context, rejectedPlayer);
            },
            gameStarted: (opponent) {
              // Переход к игре
              Navigator.of(context).pushNamed('/game');
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
                      context.read<HomeBloc>().add(
                        const HomeEvent.onInitializationRequested(),
                      );
                    },
                    child: const Text('Повторить'),
                  ),
                ],
              ),
            ),
            view: (players, selectedPlayer, isFirstLaunch) => Column(
              children: [
                /// Список игроков
                Expanded(
                  flex: 2,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: players.length,
                    itemBuilder: (context, index) {
                      final player = players[index];
                      return PlayerListItem(
                        player: player,
                        isSelected: selectedPlayer?.id == player.id,
                        onTap: () {
                          context.read<HomeBloc>().add(
                            HomeEvent.onPlayerSelected(player: player),
                          );
                        },
                      );
                    },
                  ),
                ),

                /// Кнопка приглашения
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: selectedPlayer != null
                        ? () {
                            context.read<HomeBloc>().add(
                              HomeEvent.onInvitePlayer(player: selectedPlayer),
                            );
                          }
                        : null,
                    child: const Text('Пригласить'),
                  ),
                ),
              ],
            ),
            invitationPending: (invitedPlayer) =>
                const Center(child: CircularProgressIndicator()),
            invitationReceived: (invitingPlayer) =>
                const Center(child: CircularProgressIndicator()),
            invitationRejected: (rejectedPlayer) =>
                const Center(child: CircularProgressIndicator()),
            gameStarted: (opponent) =>
                const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }

  /// Показать диалог ввода псевдонима
  void _showNicknameDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const NicknameDialog(),
    );
  }

  /// Показать диалог ожидания
  void _showWaitingDialog(BuildContext context, Player invitedPlayer) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Ожидание'),
        content: Text('Ожидайте когда ${invitedPlayer.nickname} согласится'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<HomeBloc>().add(
                const HomeEvent.onCancelInvitation(),
              );
            },
            child: const Text('Отмена'),
          ),
        ],
      ),
    );
  }

  /// Показать диалог приглашения
  void _showInvitationDialog(BuildContext context, Player invitingPlayer) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Приглашение'),
        content: Text('${invitingPlayer.nickname} пригласил вас поиграть'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<HomeBloc>().add(
                const HomeEvent.onRejectInvitation(),
              );
            },
            child: const Text('Отмена'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<HomeBloc>().add(
                const HomeEvent.onAcceptInvitation(),
              );
            },
            child: const Text('Начать'),
          ),
        ],
      ),
    );
  }

  /// Показать диалог отказа
  void _showRejectionDialog(BuildContext context, Player rejectedPlayer) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Отказ'),
        content: Text('${rejectedPlayer.nickname} отказался играть'),
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
