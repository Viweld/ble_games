import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/di/builders.dep_gen.dart';
import 'core/themes/app_theme.dart';
import 'core/di/environment.dart';
import 'features/splash/presentation/splash_screen.dart';
import 'features/home/presentation/home_screen.dart';
import 'features/games_list/presentation/games_list_screen.dart';
import 'features/tictactoe/presentation/game_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Инициализация зависимостей
  final environment = Environment();
  await environment.prepare();

  // Устанавливаем ориентацию экрана
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    DepProvider(
      environment: (await Environment().prepare()).lock(),
      child: const BluetoothToeApp(),
    ),
  );
}

/// Главное приложение
class BluetoothToeApp extends StatelessWidget {
  const BluetoothToeApp({super.key});

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
