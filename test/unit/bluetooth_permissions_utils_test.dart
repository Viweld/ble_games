import 'package:flutter_test/flutter_test.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:batuga/core/utils/bluetooth_permissions_utils.dart';

void main() {
  group('BluetoothPermissionsUtils Test', () {
    test('Проверка существования утилиты', () {
      // Проверяем, что утилита существует
      expect(BluetoothPermissionsUtils, isNotNull);
    });

    test('Проверка методов утилиты', () {
      // Проверяем, что все необходимые методы существуют
      expect(
        BluetoothPermissionsUtils.areBluetoothPermissionsGranted,
        isNotNull,
      );
      expect(BluetoothPermissionsUtils.requestBluetoothPermissions, isNotNull);
      expect(
        BluetoothPermissionsUtils.openAppSettingsForPermissions,
        isNotNull,
      );
    });

    test('Проверка возвращаемого типа requestBluetoothPermissions', () async {
      // Проверяем, что метод возвращает PermissionStatus
      final result =
          await BluetoothPermissionsUtils.requestBluetoothPermissions();
      expect(result, isA<PermissionStatus>());
    });
  });
}
