import 'package:batuga/core/themes/app_theme.dart';
import 'package:flutter/material.dart';

import '../features/games_list/presentation/games_list_screen.dart';
import '../features/home/presentation/home_screen.dart';
import '../features/splash/presentation/splash_screen.dart';
import '../features/tictactoe/presentation/game_screen.dart';

/// Главное приложение
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Крестики-Нолики',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
        '/games_list': (context) => const GamesListScreen(),
        '/tictactoe': (context) => const GameScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
