import '../../../domain/logger/i_logger.dart';
import '../../../domain/transport/bluetooth/b_bluetooth_connection_manager.dart';
import '../../../domain/transport/bluetooth/i_messenger.dart';
import 'bluetooth_connector_server.dart';

final class BluetoothConnectionManagerServer
    extends BBluetoothConnectionManager {
  BluetoothConnectionManagerServer({
    required BluetoothConnectorServer connector,
    required IMessenger messenger,
    required ILogger logger,
  }) : _connector = connector,
       _messenger = messenger,
       _log = logger;

  final BluetoothConnectorServer _connector;
  final IMessenger _messenger;
  final ILogger _log;

  @override
  IMessenger get messenger => _messenger;

  /// Освободить ресурсы
  @override
  Future<void> onDispose() async {
    // TODO(Vadim): реализовать
    throw UnimplementedError('Реализовать onDispose()');
  }
}
