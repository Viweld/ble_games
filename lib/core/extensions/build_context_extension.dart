import 'package:flutter/material.dart';
import 'package:dep_gen/dep_gen.dart';

/// Расширения для BuildContext
extension BuildContextExtension on BuildContext {
  /// Получить экземпляр DI
  DepGen get depGen => DepGen();

  /// Получить тему
  ThemeData get theme => Theme.of(this);

  /// Получить цветовую схему
  ColorScheme get colorScheme => theme.colorScheme;

  /// Получить размеры экрана
  Size get screenSize => MediaQuery.of(this).size;

  /// Получить ширину экрана
  double get screenWidth => screenSize.width;

  /// Получить высоту экрана
  double get screenHeight => screenSize.height;

  /// Показать SnackBar
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(message)));
  }

  /// Показать диалог
  Future<T?> showCustomDialog<T>({
    required Widget child,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: this,
      barrierDismissible: barrierDismissible,
      builder: (context) => child,
    );
  }
}
