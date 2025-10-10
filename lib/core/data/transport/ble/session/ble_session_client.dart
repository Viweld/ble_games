import 'dart:async';

import 'package:batuga/core/domain/models/device.dart';
import 'package:batuga/core/domain/models/messages.dart';

import '../../../../domain/logger/i_logger.dart';
import '../link/ble_link_client.dart';
import 'ble_session_base.dart';
import '../../../../domain/transport/i_transport_session_client.dart';
import '../../../../domain/transport/i_messenger.dart';

final class BleSessionClient extends BleSessionBase
    implements ITransportSessionClient {
  BleSessionClient({
    required BleLinkClient connector,
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

  final BleLinkClient _connector;
  final IMessenger _messenger;
  final ILogger _log;

  late final StreamSubscription<Message> _unhandledMessagesSubscription;
  late final StreamController<Message> _handledMessagesController;

  @override
  IMessenger get messenger => _messenger;

  @override
  Stream<List<Device>> get discoveredDevicesStream =>
      _connector.discoveredDevicesStream;

  // ---------------------------------------------------------------------------
  @override
  Stream<Message> get messagesStream => _handledMessagesController.stream;

  @override
  Future<void> sendMessage(Message message) => _messenger.sendMessage(message);

  @override
  Future<void> startDiscovery() {
    // TODO: implement startDiscovery
    throw UnimplementedError();
  }

  @override
  Future<void> stopDiscovery() {
    // TODO: implement stopDiscovery
    throw UnimplementedError();
  }

  @override
  Future<void> refreshDiscovery() {
    // TODO: implement refreshDiscovery
    throw UnimplementedError();
  }

  @override
  Future<void> connectToDevice(Device device) {
    // TODO: implement connectToDevice
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
