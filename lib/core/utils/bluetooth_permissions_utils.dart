import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class BluetoothPermissionsUtils {
  static Future<bool> checkPermissions() async {
    // Определяем платформу
    if (Platform.isAndroid) {
      final deviceInfo = DeviceInfoPlugin();
      final androidInfo = await deviceInfo.androidInfo;
      final androidSdk = androidInfo.version.sdkInt;

      if (androidSdk >= 31) {
        final scan = await Permission.bluetoothScan.status;
        final connect = await Permission.bluetoothConnect.status;
        final advertise = await Permission.bluetoothAdvertise.status;
        return scan.isGranted && connect.isGranted && advertise.isGranted;
      } else {
        final bluetooth = await Permission.bluetooth.status;
        final location = await Permission.location.status;
        return bluetooth.isGranted && location.isGranted;
      }
    } else if (Platform.isIOS) {
      // На iOS Bluetooth разрешения завязаны на location + bluetooth
      final bluetooth = await Permission.bluetooth.status;
      final location = await Permission.locationWhenInUse.status;
      return bluetooth.isGranted && location.isGranted;
    }
    return false;
  }

  static Future<PermissionStatus> requestPermissions() async {
    if (Platform.isAndroid) {
      final deviceInfo = DeviceInfoPlugin();
      final androidInfo = await deviceInfo.androidInfo;
      final androidSdk = androidInfo.version.sdkInt;

      if (androidSdk >= 31) {
        final permissions = await [
          Permission.bluetoothScan,
          Permission.bluetoothConnect,
          Permission.bluetoothAdvertise,
        ].request();
        return _aggregate(permissions);
      } else {
        final permissions = await [
          Permission.bluetooth,
          Permission.location,
        ].request();
        return _aggregate(permissions);
      }
    } else if (Platform.isIOS) {
      final permissions = await [
        Permission.bluetooth,
        Permission.locationWhenInUse,
      ].request();
      return _aggregate(permissions);
    }
    return PermissionStatus.denied;
  }

  static PermissionStatus _aggregate(Map<Permission, PermissionStatus> map) {
    if (map.values.every((s) => s.isGranted)) return PermissionStatus.granted;
    if (map.values.any((s) => s.isPermanentlyDenied)) {
      return PermissionStatus.permanentlyDenied;
    }
    if (map.values.any((s) => s.isDenied)) return PermissionStatus.denied;
    return PermissionStatus.limited;
  }

  static Future<bool> openAppSettingsSafe() async {
    try {
      return await openAppSettings();
    } catch (_) {
      return false;
    }
  }
}
