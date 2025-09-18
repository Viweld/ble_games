import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';

/// Утилита для проверки и запроса Bluetooth разрешений
class BluetoothPermissionsUtils {
  /// Проверяет, предоставлены ли все необходимые Bluetooth разрешения
  static Future<bool> areBluetoothPermissionsGranted() async {
    try {
      final deviceInfo = DeviceInfoPlugin();
      final androidInfo = await deviceInfo.androidInfo;
      final androidSdk = androidInfo.version.sdkInt;

      if (androidSdk >= 31) {
        // Для Android 12+ проверяем новые разрешения
        final bluetoothScanStatus = await Permission.bluetoothScan.status;
        final bluetoothConnectStatus = await Permission.bluetoothConnect.status;
        final bluetoothAdvertiseStatus =
            await Permission.bluetoothAdvertise.status;

        return bluetoothScanStatus.isGranted &&
            bluetoothConnectStatus.isGranted &&
            bluetoothAdvertiseStatus.isGranted;
      } else {
        // Для Android до 12 проверяем старые разрешения
        final bluetoothStatus = await Permission.bluetooth.status;
        final locationStatus = await Permission.location.status;

        return bluetoothStatus.isGranted && locationStatus.isGranted;
      }
    } catch (e) {
      // В случае ошибки считаем, что разрешения не предоставлены
      return false;
    }
  }

  /// Запрашивает все необходимые Bluetooth разрешения
  static Future<PermissionStatus> requestBluetoothPermissions() async {
    try {
      final deviceInfo = DeviceInfoPlugin();
      final androidInfo = await deviceInfo.androidInfo;
      final androidSdk = androidInfo.version.sdkInt;

      if (androidSdk >= 31) {
        // Для Android 12+ запрашиваем новые разрешения
        final permissions = await [
          Permission.bluetoothScan,
          Permission.bluetoothConnect,
          Permission.bluetoothAdvertise,
        ].request();

        // Проверяем статус всех разрешений
        final allGranted =
            permissions[Permission.bluetoothScan] == PermissionStatus.granted &&
            permissions[Permission.bluetoothConnect] ==
                PermissionStatus.granted &&
            permissions[Permission.bluetoothAdvertise] ==
                PermissionStatus.granted;

        // Если все разрешения предоставлены, возвращаем granted
        if (allGranted) {
          return PermissionStatus.granted;
        }

        // Если хотя бы одно разрешение навсегда отклонено, возвращаем permanentlyDenied
        final anyPermanentlyDenied = permissions.values.any(
          (status) => status.isPermanentlyDenied,
        );
        if (anyPermanentlyDenied) {
          return PermissionStatus.permanentlyDenied;
        }

        // Если хотя бы одно разрешение отклонено, возвращаем denied
        final anyDenied = permissions.values.any((status) => status.isDenied);
        if (anyDenied) {
          return PermissionStatus.denied;
        }

        // В остальных случаях возвращаем ограниченный доступ
        return PermissionStatus.limited;
      } else {
        // Для Android до 12 запрашиваем старые разрешения
        final permissionsToRequest = [
          Permission.bluetooth,
          Permission.location,
        ];

        final permissions = await permissionsToRequest.request();

        // Проверяем статус всех разрешений
        final allGranted =
            permissions[Permission.bluetooth] == PermissionStatus.granted &&
            permissions[Permission.location] == PermissionStatus.granted;

        // Если все разрешения предоставлены, возвращаем granted
        if (allGranted) {
          return PermissionStatus.granted;
        }

        // Если хотя бы одно разрешение навсегда отклонено, возвращаем permanentlyDenied
        final anyPermanentlyDenied = permissions.values.any(
          (status) => status.isPermanentlyDenied,
        );
        if (anyPermanentlyDenied) {
          return PermissionStatus.permanentlyDenied;
        }

        // Если хотя бы одно разрешение отклонено, возвращаем denied
        final anyDenied = permissions.values.any((status) => status.isDenied);
        if (anyDenied) {
          return PermissionStatus.denied;
        }

        // В остальных случаях возвращаем ограниченный доступ
        return PermissionStatus.limited;
      }
    } catch (e) {
      // В случае ошибки возвращаем статус denied
      return PermissionStatus.denied;
    }
  }

  /// Открывает настройки приложения для предоставления разрешений вручную
  static Future<bool> openAppSettingsForPermissions() async {
    try {
      return await openAppSettings();
    } catch (e) {
      return false;
    }
  }
}
