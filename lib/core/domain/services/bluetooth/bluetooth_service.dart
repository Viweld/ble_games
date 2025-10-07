import 'i_connector_client.dart';
import 'i_connector_server.dart';
import 'i_messenger.dart';

final class BluetoothService {
  BluetoothService({
    required IConnectorClient connectorClient,
    required IConnectorServer connectorServer,
  }) : _connectorClient = connectorClient,
       _connectorServer = connectorServer {}

  final IConnectorClient _connectorClient;
  final IConnectorServer _connectorServer;
  IMessenger? _messenger;

  IConnectorClient connectAsClient() {
    return _connectorClient;
  }

  IConnectorServer connectAsServer() {
    return _connectorServer;
  }
}
