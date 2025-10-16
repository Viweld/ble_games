import 'dart:async';

import 'package:batuga/core/domain/transport/i_transport_session_client.dart';

import '../../../../domain/models/messages.dart';
import '../../../../domain/transport/i_transport_session.dart';
import '../../../../domain/transport/i_transport_session_server.dart';
import '../../../../domain/transport/i_transport_facade.dart';
import '../../../../domain/transport/models/transport_role.dart';
import '../../../../domain/transport/models/transport_session_state.dart';

final class BleTransportFacade implements ITransportFacade {
  BleTransportFacade({
    required ITransportSessionClient transportSessionClient,
    required ITransportSessionServer transportSessionServer,
  }) : _transportSessionClient = transportSessionClient,
       _transportSessionServer = transportSessionServer {
    final clientSession = transportSessionClient as ITransportSession;
    final serverSession = transportSessionServer as ITransportSession;
    // прокси-стрим сообщений от любого типа сессии
    _proxyMessagesStreamController = StreamController<Message>.broadcast();
    _proxyClientMessagesStreamSubscription = clientSession.messagesStream
        .listen(_proxyMessagesStreamController.add);
    _proxyServerMessagesStreamSubscription = serverSession.messagesStream
        .listen(_proxyMessagesStreamController.add);
    // прокси-стрим состояний подключения от любого типа сессии
    _proxyConnectionStateStreamController =
        StreamController<TransportSessionState>.broadcast();
    _proxyClientConnectionStateStreamSubscription = clientSession
        .connectionStateStream
        .listen(_proxyConnectionStateStreamController.add);
    _proxyServerConnectionStateStreamSubscription = serverSession
        .connectionStateStream
        .listen(_proxyConnectionStateStreamController.add);
  }

  final ITransportSessionClient _transportSessionClient;
  final ITransportSessionServer _transportSessionServer;
  TransportRole _role = TransportRole.server;

  // КАНАЛЫ ПЕРЕДАЧИ ДАННЫХ:
  // ---------------------------------------------------------------------------
  // Прокси контроллер для объединения потоков сообщений от клиента и сервера
  late final StreamController<Message> _proxyMessagesStreamController;
  late final StreamSubscription<Message> _proxyClientMessagesStreamSubscription;
  late final StreamSubscription<Message> _proxyServerMessagesStreamSubscription;

  // Прокси контроллер для объединения потоков состояний подключения от клиента и сервера
  late final StreamController<TransportSessionState>
  _proxyConnectionStateStreamController;
  late final StreamSubscription<TransportSessionState>
  _proxyClientConnectionStateStreamSubscription;
  late final StreamSubscription<TransportSessionState>
  _proxyServerConnectionStateStreamSubscription;

  @override
  Stream<Message> get messagesStream => _proxyMessagesStreamController.stream;

  @override
  Stream<TransportSessionState> get connectionStateStream =>
      _proxyConnectionStateStreamController.stream;

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
    await _proxyClientConnectionStateStreamSubscription.cancel();
    await _proxyServerConnectionStateStreamSubscription.cancel();
    await _proxyConnectionStateStreamController.close();
    await (_transportSessionClient as ITransportSession).dispose();
    await (_transportSessionServer as ITransportSession).dispose();
  }
}
