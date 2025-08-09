import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/models/player.dart';
import '../../../../core/extensions/build_context_extension.dart';
import '../../../core/di/builders.dep_gen.dart';
import 'bloc/home_bloc.dart';
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
          HomeStateInvitationPending(:final invitedPlayer) =>
            _showWaitingDialog(context, invitedPlayer),
          HomeStateInvitationReceived(:final invitingPlayer) =>
            _showInvitationDialog(context, invitingPlayer),
          HomeStateInvitationRejected(:final rejectedPlayer) =>
            _showRejectionDialog(context, rejectedPlayer),
          HomeStateGameStarted() => Navigator.of(context).pushNamed('/game'),
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
            HomeStateView(:final players, :final selectedPlayer) => Column(
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

                /// Кнопка ручного обновления
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextButton.icon(
                    onPressed: () => context.read<HomeBloc>().add(
                      const HomeEvent.onRefreshRequested(),
                    ),
                    icon: const Icon(Icons.refresh),
                    label: const Text('Обновить список устройств'),
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
