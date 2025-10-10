import 'dart:async';

import 'package:batuga/core/domain/transport/i_transport_session_client.dart';

import '../../../../domain/models/messages.dart';
import '../../../../domain/transport/i_transport_session.dart';
import '../../../../domain/transport/i_transport_session_server.dart';
import '../../../../domain/transport/i_transport_facade.dart';
import '../../../../domain/transport/models/transport_role.dart';

final class BleTransportFacade implements ITransportFacade {
  BleTransportFacade({
    required ITransportSessionClient transportSessionClient,
    required ITransportSessionServer transportSessionServer,
  }) : _transportSessionClient = transportSessionClient,
       _transportSessionServer = transportSessionServer {
    _proxyMessagesStreamController = StreamController<Message>.broadcast();
    _proxyClientMessagesStreamSubscription =
        (transportSessionClient as ITransportSession).messagesStream.listen(
          _proxyMessagesStreamController.add,
        );
    _proxyServerMessagesStreamSubscription =
        (transportSessionServer as ITransportSession).messagesStream.listen(
          _proxyMessagesStreamController.add,
        );
  }

  final ITransportSessionClient _transportSessionClient;
  final ITransportSessionServer _transportSessionServer;
  TransportRole _role = TransportRole.server;

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
      transportSession.sendMessage(message);

  // ---------------------------------------------------------------------------
  @override
  ITransportSession get transportSession => switch (_role) {
    TransportRole.client => _transportSessionClient as ITransportSession,
    TransportRole.server => _transportSessionServer as ITransportSession,
  };

  @override
  Future<ITransportSessionClient> startClientTransportSession() async {
    await transportSession.disconnect();
    _role = TransportRole.client;
    return _transportSessionClient;
  }

  @override
  Future<ITransportSessionServer> startServerTransportSession() async {
    await transportSession.disconnect();
    _role = TransportRole.server;
    return _transportSessionServer;
  }

  @override
  Future<void> dispose() async {
    await _proxyClientMessagesStreamSubscription.cancel();
    await _proxyServerMessagesStreamSubscription.cancel();
    await _proxyMessagesStreamController.close();
    await (_transportSessionClient as ITransportSession).dispose();
    await (_transportSessionServer as ITransportSession).dispose();
  }
}
