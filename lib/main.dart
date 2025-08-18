import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/di/builders.dep_gen.dart';
import 'core/themes/app_theme.dart';
import 'core/di/environment.dart';
import 'features/splash/presentation/splash_screen.dart';
import 'features/home/presentation/home_screen.dart';
import 'features/game/presentation/game_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Устанавливаем ориентацию экрана
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Инициализируем зависимости
  final environment = await Environment().prepare();

  runApp(
    DepProvider(
      environment: environment.lock(),
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
        '/game': (context) => const GameScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
