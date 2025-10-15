import 'package:batuga/core/domain/models/device.dart';
import 'package:bluetooth_low_energy/bluetooth_low_energy.dart';
import 'package:device_info_plus/device_info_plus.dart';

import '../../domain/repositories/i_device_repository.dart';

/// Реализация репозитория устройства
final class DeviceRepository implements IDeviceRepository {
  DeviceRepository({required String appName, required String serviceId})
    : _appName = appName,
      _serviceUuid = UUID.fromString(serviceId);

  final String _appName;
  final UUID _serviceUuid;

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
    return Device(
      id: _serviceUuid.toString(),
      name: deviceName,
      isOurApp: true,
    );
  }
}
