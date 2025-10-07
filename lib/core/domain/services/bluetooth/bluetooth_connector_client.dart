import 'package:batuga/core/domain/models/device.dart';
import 'b_bluetooth_connector.dart';
import 'i_connector_client.dart';

final class BluetoothConnectorClient extends BBluetoothConnector
    implements IConnectorClient {
  @override
  // TODO: implement discoveredDevicesStream
  Stream<List<Device>> get discoveredDevicesStream =>
      throw UnimplementedError();

  @override
  Future<void> startDiscovery() {
    // TODO: implement startDiscovery
    throw UnimplementedError();
  }

  @override
  Future<void> stopDiscovery() {
    // TODO: implement stopDiscovery
    throw UnimplementedError();
  }

  @override
  Future<void> refreshDiscovery() {
    // TODO: implement refreshDiscovery
    throw UnimplementedError();
  }

  @override
  Future<void> connectToDevice(Device device) {
    // TODO: implement connectToDevice
    throw UnimplementedError();
  }

  // ВСПОМОГАТЕЛЬНЫЕ МЕТОДЫ
  // ---------------------------------------------------------------------------
}
