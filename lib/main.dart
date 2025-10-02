import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/app.dart';
import 'core/di/builders.dep_gen.dart';
import 'core/di/environment.dart';

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
      child: const App(),
    ),
  );
}
