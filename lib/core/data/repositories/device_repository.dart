import 'package:batuga/core/domain/models/device.dart';
import 'package:device_info_plus/device_info_plus.dart';

import '../../domain/repositories/i_device_repository.dart';

/// Реализация репозитория устройства
class DeviceRepository implements IDeviceRepository {
  const DeviceRepository({required String appName}) : _appName = appName;

  final String _appName;

  /// Получение имени устройства
  @override
  Future<String> getDeviceName() async {
    try {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      return '$_appName-${androidInfo.model}';
    } catch (e) {
      return '$_appName-Device';
    }
  }

  @override
  Future<Device> getDevice() async {
    final deviceName = await getDeviceName();
    return Device(id: '', name: deviceName, isOurApp: true);
  }
}
