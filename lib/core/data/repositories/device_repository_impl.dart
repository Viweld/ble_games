import 'package:ble_peer_session/ble_peer_session.dart';
import 'package:device_info_plus/device_info_plus.dart';

import '../../domain/repositories/device_repository.dart';

final class DeviceRepositoryImpl implements DeviceRepository {
  DeviceRepositoryImpl({required String appName, required String serviceId})
    : _appName = appName,
      _serviceId = serviceId;

  final String _appName;
  final String _serviceId;

  @override
  Future<String> getDeviceName() async {
    try {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      return '$_appName-${androidInfo.model}';
    } catch (_) {
      return '$_appName-Device';
    }
  }

  @override
  Future<Device> getDevice() async {
    final deviceName = await getDeviceName();
    return Device(id: _serviceId, name: deviceName, isOurApp: true);
  }
}
