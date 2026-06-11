import 'package:ble_peer_session/ble_peer_session.dart';
import 'package:flutter/foundation.dart';

final class AppLoggerImpl implements Logger {
  @override
  void d(String message) {
    if (kDebugMode) debugPrint(message);
  }

  @override
  void e(String message) {
    if (kDebugMode) debugPrint('ERROR: $message');
  }

  @override
  void w(String message) {
    if (kDebugMode) debugPrint('WARNING: $message');
  }
}
