import 'dart:async';

import 'package:batuga/core/domain/transport/i_transport_session_client.dart';

import '../../../../domain/models/messages.dart';
import '../../../../domain/transport/i_transport_session.dart';
import '../../../../domain/transport/i_transport_session_server.dart';
import '../../../../domain/transport/i_transport_facade.dart';

final class BleTransportFacade implements ITransportFacade {
  BleTransportFacade({
    required ITransportSessionClient connectionManagerClient,
    required ITransportSessionServer connectionManagerServer,
  }) : _connectionManagerClient = connectionManagerClient,
       _connectionManagerServer = connectionManagerServer {
    _proxyMessagesStreamController = StreamController<Message>.broadcast();
    _proxyClientMessagesStreamSubscription =
        (connectionManagerClient as ITransportSession).messagesStream.listen(
          _proxyMessagesStreamController.add,
        );
    _proxyServerMessagesStreamSubscription =
        (connectionManagerServer as ITransportSession).messagesStream.listen(
          _proxyMessagesStreamController.add,
        );
  }

  final ITransportSessionClient _connectionManagerClient;
  final ITransportSessionServer _connectionManagerServer;
  TransportRole? _mode;

  // КАНАЛ ПЕРЕДАЧИ ДАННЫХ:
  // ---------------------------------------------------------------------------
  // Прокси контроллер для объединения потоков сообщений от клиента и сервера
  late final StreamController<Message> _proxyMessagesStreamController;
  late final StreamSubscription<Message> _proxyClientMessagesStreamSubscription;
  late final StreamSubscription<Message> _proxyServerMessagesStreamSubscription;

  @override
  Stream<Message> get messagesStream => _proxyMessagesStreamController.stream;

  @override
  Future<void> sendMessage(Message message) =>
      (connectionManager as ITransportSession).sendMessage(message);
  // ---------------------------------------------------------------------------

  @override
  ITransportSessionClient get connectionManagerClient =>
      _connectionManagerClient;

  @override
  ITransportSessionServer get connectionManagerServer =>
      _connectionManagerServer;

  @override
  ITransportSession? get connectionManager => switch (_mode) {
    TransportRole.client => _connectionManagerClient as ITransportSession,
    TransportRole.server => _connectionManagerServer as ITransportSession,
    _ => null,
  };

  @override
  void initializeClient() => _mode = TransportRole.client;

  @override
  void initializeServer() => _mode = TransportRole.server;

  @override
  Future<void> dispose() async {
    await _proxyClientMessagesStreamSubscription.cancel();
    await _proxyServerMessagesStreamSubscription.cancel();
    await _proxyMessagesStreamController.close();
    await (_connectionManagerClient as ITransportSession).dispose();
    await (_connectionManagerServer as ITransportSession).dispose();
  }
}
