import 'package:flutter/foundation.dart';

/// Простой логгер для Bluetooth репозитория
class BluetoothLogger {
  void debug(String message) {
    debugPrint('[Bluetooth] $message');
  }

  void error(String message) {
    debugPrint('[Bluetooth ERROR] $message');
  }
}
