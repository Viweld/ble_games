import 'package:bluetooth_toe/core/di/builders.dep_gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/splash_bloc.dart';

/// Экран сплэш-скрина
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DepProvider.of(context).buildSplashBloc(),
      child: const _SplashView(),
    );
  }
}

class _SplashView extends StatelessWidget {
  const _SplashView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: BlocConsumer<SplashBloc, SplashState>(
        listenWhen: (previous, state) => switch (state) {
          SplashStateInitializationError() => true,
          SplashStateView() => true,
          _ => false,
        },
        buildWhen: (previous, state) => switch (state) {
          SplashStateInitializationPending() => true,
          _ => false,
        },
        listener: (context, state) => switch (state) {
          SplashStateInitializationError(:final message) =>
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Ошибка: $message'))),
          SplashStateView() => Navigator.of(
            context,
          ).pushReplacementNamed('/home'),
          _ => null,
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// Логотип приложения
                Icon(
                  Icons.games,
                  size: 120,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),

                const SizedBox(height: 24),

                /// Название приложения
                Text(
                  'Крестики-Нолики',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                /// Подзаголовок
                Text(
                  'Игра по Bluetooth',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onPrimary.withOpacity(0.8),
                  ),
                ),

                const SizedBox(height: 48),

                /// Индикатор загрузки
                if (switch (state) {
                  SplashStateInitializationPending() => true,
                  _ => false,
                })
                  CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
