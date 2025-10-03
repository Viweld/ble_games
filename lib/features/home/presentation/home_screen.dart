import 'package:batuga/features/home/presentation/widgets/awaiting_connection_dialog/awaiting_connection_dialog.dart';
import 'package:batuga/features/home/presentation/widgets/searching_devices_dialog/searching_devices_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/models/user.dart';
import '../../../../core/extensions/build_context_extension.dart';
import '../../../core/di/builders.dep_gen.dart';
import 'bloc/home_bloc.dart';

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
          HomeStateInvitationReceived() => true,
          HomeStateInvitationRejected() => true,
          HomeStateConnected() => true,
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
          HomeStateInvitationReceived(:final invitingUser) =>
            _showInvitationDialog(context, invitingUser),
          HomeStateInvitationRejected(:final rejectedUser) =>
            _showRejectionDialog(context, rejectedUser),
          HomeStateConnected() => _toGamesListScreen(context),
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
            HomeStateView() => _MainView(
              onAwaitConnectionPressed: () =>
                  _onAwaitConnectionPressed(context),
              onSearchDevicesPressed: () => _onSearchDevicesPressed(context),
            ),
            _ => throw UnsupportedError('${state.runtimeType} нельзя строить'),
          };
        },
      ),
    );
  }

  /// Обработчик нажатия кнопки 'Ожидать присоединения'
  void _onAwaitConnectionPressed(BuildContext context) {
    AwaitingConnectionDialog.show(context);
  }

  /// Обработчик нажатия кнопки 'Найти и подключиться'
  void _onSearchDevicesPressed(BuildContext context) {
    SearchingDevicesDialog.show(context);
  }

  /// Обработчик перехода на экран списка игр
  void _toGamesListScreen(BuildContext context) {
    Navigator.pushNamed(context, '/games_list');
  }

  /// Показать диалог приглашения
  void _showInvitationDialog(BuildContext context, User invitingUser) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Приглашение'),
        content: Text('${invitingUser.name} пригласил вас поиграть'),
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

/// Основной вид
class _MainView extends StatelessWidget {
  const _MainView({
    required this.onAwaitConnectionPressed,
    required this.onSearchDevicesPressed,
  });

  /// Коллбэк нажатия 'Ожидать присоединения'
  final VoidCallback onAwaitConnectionPressed;

  /// Коллбэк нажатия 'Найти и подключиться'
  final VoidCallback onSearchDevicesPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.bluetooth, size: 64, color: Colors.blue),
            const SizedBox(height: 32),
            const Text(
              'Выберите режим подключения',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),

            /// Кнопка 'Ожидать присоединения'
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: onAwaitConnectionPressed,
                icon: const Icon(Icons.visibility),
                label: const Text('Ожидать присоединения'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                ),
              ),
            ),
            const SizedBox(height: 16),

            /// Кнопка 'Найти и подключиться'
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: onSearchDevicesPressed,
                icon: const Icon(Icons.search),
                label: const Text('Найти и подключиться'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
