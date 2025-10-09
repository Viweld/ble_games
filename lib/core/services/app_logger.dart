import 'package:flutter/foundation.dart';

import '../domain/logger/i_logger.dart';

final class AppLogger implements ILogger {
  @override
  void d(String message) {
    _colorPrint('DEBUG: $message');
  }

  @override
  void w(String message) {
    _colorPrint('WARNING: $message', color: 'yellow');
  }

  @override
  void e(String message) {
    _colorPrint('ERROR: $message', color: 'red');
  }

  // ВСПОМОГАТЕЛЬНЫЕ МЕТОДЫ
  // ---------------------------------------------------------------------------
  /// Печатает сообщение в консоль с указанным цветом
  void _colorPrint(String message, {String color = 'reset'}) {
    const colors = {
      'reset': '\x1B[0m',
      'red': '\x1B[31m',
      'green': '\x1B[32m',
      'yellow': '\x1B[33m',
      'blue': '\x1B[34m',
      'magenta': '\x1B[35m',
      'cyan': '\x1B[36m',
      'white': '\x1B[37m',
    };

    final prefix = colors[color] ?? colors['reset'];
    debugPrint('$prefix$message${colors['reset']}');
  }
}
