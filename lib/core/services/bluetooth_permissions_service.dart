import 'package:permission_handler/permission_handler.dart';

import '../domain/services/i_bluetooth_permissions_service.dart';
import '../utils/bluetooth_permissions_utils.dart';

class BluetoothPermissionsService implements IBluetoothPermissionsService {
  @override
  Future<bool> checkPermissions() async {
    bool allPermissionsGranted =
        await BluetoothPermissionsUtils.checkPermissions();

    if (!allPermissionsGranted) {
      final permissionStatus =
          await BluetoothPermissionsUtils.requestPermissions();
      allPermissionsGranted = permissionStatus.isGranted;

      if (permissionStatus.isPermanentlyDenied) {
        if (await BluetoothPermissionsUtils.openAppSettingsSafe()) {
          throw Exception(
            'Пожалуйста, предоставьте все необходимые разрешения в настройках приложения и перезапустите приложение.',
          );
        } else {
          throw Exception(
            'Не все необходимые разрешения Bluetooth были предоставлены. Пожалуйста, предоставьте разрешения в настройках приложения.',
          );
        }
      }

      if (permissionStatus.isDenied) {
        throw Exception(
          'Не все необходимые разрешения Bluetooth были предоставлены.',
        );
      }
    }

    return allPermissionsGranted;
  }

  @override
  Future<bool> openAppSettings() =>
      BluetoothPermissionsUtils.openAppSettingsSafe();
}
