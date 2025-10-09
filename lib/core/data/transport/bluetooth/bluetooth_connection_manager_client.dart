import '../../../domain/logger/i_logger.dart';
import '../../../domain/transport/bluetooth/b_bluetooth_connection_manager.dart';
import '../../../domain/transport/bluetooth/i_messenger.dart';
import 'bluetooth_connector_client.dart';

final class BluetoothConnectionManagerClient
    extends BBluetoothConnectionManager {
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

  /// Освободить ресурсы
  @override
  Future<void> onDispose() async {
    // TODO(Vadim): реализовать
    throw UnimplementedError('Реализовать onDispose()');
  }
}
