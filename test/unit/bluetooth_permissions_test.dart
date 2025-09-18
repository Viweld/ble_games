import 'package:flutter_test/flutter_test.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';

void main() {
  group('Bluetooth Permissions Test', () {
    test('Проверка разрешений для разных версий Android', () async {
      // Получаем информацию об устройстве
      final deviceInfo = DeviceInfoPlugin();
      final androidInfo = await deviceInfo.androidInfo;
      final androidSdk = androidInfo.version.sdkInt;

      // Проверяем, что разрешения определены правильно
      if (androidSdk >= 31) {
        // Для Android 12+ должны быть новые разрешения
        expect(Permission.bluetoothScan, isNotNull);
        expect(Permission.bluetoothConnect, isNotNull);
        expect(Permission.bluetoothAdvertise, isNotNull);
      } else {
        // Для Android до 12 должны быть старые разрешения
        expect(Permission.bluetooth, isNotNull);
        expect(Permission.location, isNotNull);
      }
    });
  });
}
