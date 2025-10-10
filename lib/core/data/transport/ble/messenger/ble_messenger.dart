import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:batuga/core/data/models/messages_dto.dart';
import 'package:batuga/core/domain/models/messages.dart';

import '../../../../domain/logger/i_logger.dart';
import '../../../../domain/transport/i_messenger.dart';
import '../link/ble_link_base.dart';

final class BleMessenger implements IMessenger {
  BleMessenger({required BleLinkBase connector, required ILogger logger})
    : _connector = connector,
      _log = logger {
    _incomingRawMessagesSubscription = connector.incomingRawMessageStream
        .listen(_incomingRawMessagesListener);
    _incomingMessagesController = StreamController<Message>.broadcast();
  }

  late StreamSubscription<Uint8List> _incomingRawMessagesSubscription;

  final BleLinkBase _connector;
  final ILogger _log;

  late final StreamController<Message> _incomingMessagesController;

  @override
  Future<void> dispose() => _incomingRawMessagesSubscription.cancel();

  @override
  Stream<Message> get messages => _incomingMessagesController.stream;

  @override
  Future<void> sendMessage(Message message) async {
    _log.d('📤 Запрос на отправку сообщения ${message.runtimeType}');
    await _connector.sendRawMessage(
      utf8.encode(jsonEncode(MessageDto.fromDomain(message))),
    );
  }

  // ВСПОМОГАТЕЛЬНЫЕ МЕТОДЫ
  // ---------------------------------------------------------------------------
  /// Переводит входящие сырые данные в поток сообщений
  void _incomingRawMessagesListener(Uint8List event) {
    if (_incomingMessagesController.isClosed) return;
    try {
      final message = utf8.decode(event);
      _log.d('📥 Входящее сообщение: $message');
      _incomingMessagesController.add(
        MessageDto.fromJson(jsonDecode(message)).toDomain(),
      );
    } catch (e) {
      _log.e('❌ Ошибка обработки входящих данных: $e');
    }
  }
}
