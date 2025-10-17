import 'dart:async';

import 'package:batuga/core/domain/models/peer_endpoint.dart';

import '../../../../domain/logger/i_logger.dart';
import '../../../../domain/models/messages.dart';
import '../link/ble_link_server.dart';
import 'ble_session_base.dart';
import '../../../../domain/transport/i_transport_session_server.dart';
import '../../../../domain/transport/i_messenger.dart';

final class BleSessionServer extends BleSessionBase
    implements ITransportSessionServer {
  BleSessionServer({
    required BleLinkServer link,
    required IMessenger messenger,
    required ILogger logger,
  }) : _link = link,
       _messenger = messenger,
       _log = logger {
    _unhandledMessagesSubscription = _messenger.messagesStream.listen(
      _messagesHandler,
    );
    _handledMessagesController = StreamController<Message>.broadcast();
  }

  final BleLinkServer _link;
  final IMessenger _messenger;
  final ILogger _log;

  late final StreamSubscription<Message> _unhandledMessagesSubscription;
  late final StreamController<Message> _handledMessagesController;

  @override
  Stream<Message> get messagesStream => _handledMessagesController.stream;

  @override
  Future<void> sendMessage(Message message) => _messenger.sendMessage(message);

  @override
  Future<void> startAdvertising({required PeerEndpoint localPeer}) async {
    await _link.startAdvertisingAs(deviceName: localPeer.device.name);
    super.initSessionState(localPeer: localPeer);
  }

  @override
  Future<void> stopAdvertising() => _link.stopAdvertising();

  @override
  Future<void> acceptInvitation() async {
    await _messenger.sendMessage(
      AcceptanceMessage(peerEndpoint: super.localPeer),
    );
    super.onConnectionRequestUserAccepted();
  }

  @override
  Future<void> rejectInvitation() async {
    await _messenger.sendMessage(
      RejectionMessage(peerEndpoint: super.localPeer),
    );
    super.onConnectionRequestUserRejected();
  }

  @override
  Future<void> disconnect() async {
    await _messenger.sendMessage(
      DisconnectionMessage(peerEndpoint: super.localPeer),
    );
    await _link.disconnect();
    super.onSessionDisconnected();
  }

  /// Освободить ресурсы
  @override
  Future<void> onDispose() async {
    await _link.dispose();
    await _messenger.dispose();
    await _unhandledMessagesSubscription.cancel();
    await _handledMessagesController.close();
  }

  // ВСПОМОГАТЕЛЬНЫЕ МЕТОДЫ
  // ---------------------------------------------------------------------------
  /// Обработчик входящих сообщений
  Future<void> _messagesHandler(Message event) async {
    _log.d('Ретрансляция сообщения в BleSessionServer');
    if (_handledMessagesController.isClosed) return;
    _handledMessagesController.add(event);

    if (event is InvitationMessage) {
      super.onConnectionInvitationReceived(remotePeer: event.peerEndpoint);
    } else if (event is DisconnectionMessage) {
      _log.d('Соединение прервано по инициативе клиента');
      await _link.disconnect();
      super.onSessionDisconnected();
    }
  }
}
