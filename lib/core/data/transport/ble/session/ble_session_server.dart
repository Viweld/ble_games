import 'dart:async';

import '../../../../domain/logger/i_logger.dart';
import '../../../../domain/models/messages.dart';
import '../link/ble_link_server.dart';
import 'ble_session_base.dart';
import '../../../../domain/transport/i_transport_session_server.dart';
import '../../../../domain/transport/i_messenger.dart';

final class BleSessionServer extends BleSessionBase
    implements ITransportSessionServer {
  BleSessionServer({
    required BleLinkServer connector,
    required IMessenger messenger,
    required ILogger logger,
  }) : _connector = connector,
       _messenger = messenger,
       _log = logger {
    _unhandledMessagesSubscription = _messenger.messages.listen(
      _messagesHandler,
    );
    _handledMessagesController = StreamController<Message>.broadcast();
  }

  final BleLinkServer _connector;
  final IMessenger _messenger;
  final ILogger _log;

  late final StreamSubscription<Message> _unhandledMessagesSubscription;
  late final StreamController<Message> _handledMessagesController;

  @override
  Stream<Message> get messagesStream => _handledMessagesController.stream;

  @override
  Future<void> sendMessage(Message message) => _messenger.sendMessage(message);

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
  Future<void> disconnect() {
    // TODO: implement disconnect
    throw UnimplementedError();
  }

  /// Освободить ресурсы
  @override
  Future<void> onDispose() async {
    await _connector.dispose();
    await _messenger.dispose();
    await _unhandledMessagesSubscription.cancel();
    await _handledMessagesController.close();
  }

  // ВСПОМОГАТЕЛЬНЫЕ МЕТОДЫ
  // ---------------------------------------------------------------------------
  /// Обработчик входящих сообщений
  void _messagesHandler(Message event) {
    // TODO: implement messagesHandler
    throw UnimplementedError();
  }
}
