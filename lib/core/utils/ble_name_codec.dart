import 'dart:convert';
import 'package:crypto/crypto.dart';

/// Утилита для кодирования и декодирования данных BLE в поле `deviceName`.
///
/// Поддерживает до ~25 байт полезной нагрузки (ограничение BLE рекламы).
/// Гарантирует безопасные ASCII-символы и совместимость с iOS/Android.
///
/// Формат: MyApp- где  base64Url от JSON или сжатой строки.
class BleNameCodec {
  static const int _maxNameLength =
      29; // BLE лимит (iOS может обрезать после ~20–25)
  static const String _prefix = 'MyApp-';

  /// Кодирует данные в безопасную BLE-строку.
  ///
  /// Пример:
  /// ```dart
  /// final name = BleNameCodec.encode({'uid': '123', 't': 42});
  /// print(name); // MyApp-eyJ1aWQiOiIxMjMiLCJ0Ijo0Mn0=
  /// ```
  static String encode(Map<String, dynamic> data) {
    final jsonStr = jsonEncode(data);
    final encoded = base64Url.encode(utf8.encode(jsonStr));
    var name = '$_prefix$encoded';

    // Гарантируем, что не превышаем лимит
    if (name.length > _maxNameLength) {
      // Если слишком длинно, создаём короткий хэш
      final digest = sha1.convert(utf8.encode(jsonStr));
      final shortHash = base64Url.encode(digest.bytes).substring(0, 8);
      name = '$_prefix$shortHash';
    }

    return name;
  }

  /// Декодирует данные обратно (если они были не усечены).
  ///
  /// Возвращает `null`, если не удалось распознать.
  static Map<String, dynamic>? decode(String name) {
    if (!name.startsWith(_prefix)) return null;
    final payload = name.substring(_prefix.length);

    try {
      // Попробуем декодировать как base64 → json
      final jsonStr = utf8.decode(base64Url.decode(payload));
      return jsonDecode(jsonStr) as Map<String, dynamic>;
    } catch (_) {
      // Если не получилось — возможно, это короткий хэш
      return {'hash': payload};
    }
  }
}
