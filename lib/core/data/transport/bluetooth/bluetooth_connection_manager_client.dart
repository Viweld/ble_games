import 'package:batuga/core/domain/models/device.dart';

import '../../../domain/logger/i_logger.dart';
import '../../../domain/transport/bluetooth/b_bluetooth_connection_manager.dart';
import '../../../domain/transport/bluetooth/i_connection_manager_client.dart';
import '../../../domain/transport/bluetooth/i_messenger.dart';
import 'bluetooth_connector_client.dart';

final class BluetoothConnectionManagerClient extends BBluetoothConnectionManager
    implements IConnectionManagerClient {
  BluetoothConnectionManagerClient({
    required BluetoothConnectorClient connector,
    required IMessenger messenger,
    required ILogger logger,
  }) : _connector = connector,
       _messenger = messenger,
       _log = logger;

  final BluetoothConnectorClient _connector;
  final IMessenger _messenger;
  final ILogger _log;

  @override
  IMessenger get messenger => _messenger;

  @override
  Stream<List<Device>> get discoveredDevicesStream =>
      _connector.discoveredDevicesStream;

  /// Освободить ресурсы
  @override
  Future<void> onDispose() async {
    await _messenger.dispose();
    await _connector.dispose();
  }

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

  @override
  Future<void> disconnect() {
    // TODO: implement disconnect
    throw UnimplementedError();
  }
}
