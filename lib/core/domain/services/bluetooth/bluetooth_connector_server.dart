import 'dart:typed_data';

import 'b_bluetooth_connector.dart';
import 'i_connector_server.dart';

final class BluetoothConnectorServer extends BBluetoothConnector
    implements IConnectorServer {
  @override
  Future<void> startAdvertising() {
    // TODO: implement startAdvertising
    throw UnimplementedError();
  }

  @override
  Future<void> stopAdvertising() {
    // TODO: implement stopAdvertising
    throw UnimplementedError();
  }

  @override
  Future<void> confirmConnectionRequest() {
    // TODO: implement confirmConnectionRequest
    throw UnimplementedError();
  }

  @override
  Future<void> rejectConnectionRequest() {
    // TODO: implement rejectConnectionRequest
    throw UnimplementedError();
  }

  @override
  Future<void> sendRawMessage(Uint8List data) {
    // TODO: implement sendRawMessage
    throw UnimplementedError();
  }

  @override
  Future<void> disconnect() {
    // TODO: implement disconnect
    throw UnimplementedError();
  }

  @override
  Future<void> dispose() {
    // TODO: implement dispose
    throw UnimplementedError();
  }

  // ВСПОМОГАТЕЛЬНЫЕ МЕТОДЫ
  // ---------------------------------------------------------------------------
}
