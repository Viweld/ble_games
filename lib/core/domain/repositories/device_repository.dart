import 'package:ble_peer_session/ble_peer_session.dart';

/// Репозиторий локального устройства.
abstract interface class DeviceRepository {
  Future<String> getDeviceName();

  Future<Device> getDevice();
}
