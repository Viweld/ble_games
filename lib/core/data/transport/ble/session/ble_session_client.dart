import 'dart:async';

import 'package:batuga/core/domain/models/device.dart';
import 'package:batuga/core/domain/models/messages.dart';

import '../../../../domain/logger/i_logger.dart';
import '../../../../domain/models/peer_endpoint.dart';
import '../link/ble_link_client.dart';
import 'ble_session_base.dart';
import '../../../../domain/transport/i_transport_session_client.dart';
import '../../../../domain/transport/i_messenger.dart';

final class BleSessionClient extends BleSessionBase
    implements ITransportSessionClient {
  BleSessionClient({
    required BleLinkClient link,
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

  final BleLinkClient _link;
  final IMessenger _messenger;
  final ILogger _log;

  late final StreamSubscription<Message> _unhandledMessagesSubscription;
  late final StreamController<Message> _handledMessagesController;

  @override
  Stream<List<Device>> get discoveredDevicesStream =>
      _link.discoveredDevicesStream;

  // ---------------------------------------------------------------------------
  @override
  Stream<Message> get messagesStream => _handledMessagesController.stream;

  @override
  Future<void> sendMessage(Message message) => _messenger.sendMessage(message);

  @override
  Future<void> startDiscovery({required PeerEndpoint localPeer}) async {
    await _link.startDiscovery();
    super.initSessionState(localPeer: localPeer);
  }

  @override
  Future<void> stopDiscovery() => _link.stopDiscovery();

  @override
  Future<void> refreshDiscovery() => _link.refreshDiscovery();

  @override
  Future<void> connectToDevice(Device device) async {
    await _link.connectToDevice(device);
    await _messenger.sendMessage(
      InvitationMessage(peerEndpoint: super.localPeer),
    );
    super.onConnectionInvitationSent();
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
    _log.d('Ретрансляция сообщения в BleSessionClient');
    if (_handledMessagesController.isClosed) return;
    _handledMessagesController.add(event);

    // Обрабатываем события управления соединением
    if (event is RejectionMessage) {
      _log.w('Получен отказ на приглашение');
      await _link.disconnect();
      super.onConnectionRequestRemoteRejected();
    } else if (event is AcceptanceMessage) {
      _log.d('Приглашение принято');
      super.onConnectionRequestRemoteConfirmed(remotePeer: event.peerEndpoint);
    } else if (event is DisconnectionMessage) {
      _log.d('Соединение прервано по инициативе сервера');
      await _link.disconnect();
      super.onSessionDisconnected();
    }
  }
}
