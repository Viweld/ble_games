import 'dart:async';

import 'package:batuga/features/home/presentation/widgets/client_session_dialog/client_session_dialog.dart';
import 'package:batuga/features/home/presentation/widgets/nickname_dialog/nickname_dialog.dart';
import 'package:batuga/features/home/presentation/widgets/server_session_dialog/server_session_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/builders.dep_gen.dart';
import '../../../core/presentation/widgets/common_progress_indicator.dart';
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
      appBar: AppBar(
        title: const Text('Добро пожаловать в BaTuGa'),
        centerTitle: true,
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listenWhen: (previous, state) => switch (state) {
          HomeStateStartAsServer() => true,
          HomeStateStartAsClient() => true,
          HomeStateNickNameRequired() => true,
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
          HomeStateStartAsServer() => _showStartAsServerDialog(context),
          HomeStateStartAsClient() => _showStartAsClientDialog(context),
          HomeStateNickNameRequired(:final role) => _showNickNameDialog(
            context,
            role,
          ),
          HomeStateConnected() => _toGamesListScreen(context),
          _ => null,
        },
        builder: (context, state) {
          return switch (state) {
            HomeStateInitializationPending() => const Center(
              child: CommonProgressIndicator(),
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
              onStartSeverSessionTapped: () =>
                  _onStartSeverSessionTapped(context),
              onStartClientSessionTapped: () =>
                  _onStartClientSessionTapped(context),
            ),
            _ => throw UnsupportedError('${state.runtimeType} нельзя строить'),
          };
        },
      ),
    );
  }

  /// Обработчик нажатия кнопки 'Начать как сервер'
  void _onStartSeverSessionTapped(BuildContext context) {
    context.read<HomeBloc>().add(const HomeEvent.onStartSeverSessionTapped());
  }

  /// Обработчик нажатия кнопки 'Начать как клиент'
  void _onStartClientSessionTapped(BuildContext context) {
    context.read<HomeBloc>().add(const HomeEvent.onStartClientSessionTapped());
  }

  /// Обработчик состояние перехода на экран списка игр
  void _toGamesListScreen(BuildContext context) {
    unawaited(Navigator.pushNamed(context, '/games_list'));
  }

  /// Обработчик состояние открытия диалога подключения в роли сервера
  Future<void> _showStartAsServerDialog(BuildContext context) async {
    await ServerSessionDialog.show(context);
  }

  /// Обработчик состояние открытия диалога подключения в роли клиента
  Future<void> _showStartAsClientDialog(BuildContext context) async {
    await ClientSessionDialog.show(context);
  }

  /// Обработчик состояния отсутствия записи о текущем пользователе
  Future<void> _showNickNameDialog(BuildContext context, StartAs role) async {
    final result = await NicknameDialog.show(context);
    if (!context.mounted || result != true) return;
    switch (role) {
      case StartAs.server:
        await ServerSessionDialog.show(context);
      case StartAs.client:
        await ClientSessionDialog.show(context);
    }
  }

  // /// Показать диалог приглашения
  // void _showInvitationDialog(BuildContext context, User invitingUser) {
  //   unawaited(
  //     showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (context) => AlertDialog(
  //         title: const Text('Приглашение'),
  //         content: Text('${invitingUser.name} пригласил вас поиграть'),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //               context.read<HomeBloc>().add(
  //                 const HomeEvent.onRejectInvitation(),
  //               );
  //             },
  //             child: const Text('Отмена'),
  //           ),
  //           ElevatedButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //               context.read<HomeBloc>().add(
  //                 const HomeEvent.onAcceptInvitation(),
  //               );
  //             },
  //             child: const Text('Начать'),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  //
  // /// Показать диалог отказа
  // void _showRejectionDialog(BuildContext context, User rejectedUser) {
  //   unawaited(
  //     showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         title: const Text('Отказ'),
  //         content: Text('${rejectedUser.name} отказался играть'),
  //         actions: [
  //           ElevatedButton(
  //             onPressed: () => Navigator.of(context).pop(),
  //             child: const Text('Ок'),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}

/// Основной вид
class _MainView extends StatelessWidget {
  const _MainView({
    required this.onStartSeverSessionTapped,
    required this.onStartClientSessionTapped,
  });

  /// Коллбэк нажатия 'Ожидать присоединения'
  final VoidCallback onStartSeverSessionTapped;

  /// Коллбэк нажатия 'Найти и подключиться'
  final VoidCallback onStartClientSessionTapped;

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
                onPressed: onStartSeverSessionTapped,
                icon: const Icon(Icons.visibility),
                label: const Text('Ожидать присоединения'),
              ),
            ),
            const SizedBox(height: 16),

            /// Кнопка 'Найти и подключиться'
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: onStartClientSessionTapped,
                icon: const Icon(Icons.search),
                label: const Text('Найти и подключиться'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
