import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:batuga/core/data/models/messages_dto.dart';
import 'package:batuga/core/domain/models/messages.dart';
import 'package:batuga/core/domain/services/bluetooth/b_bluetooth_connector.dart';
import 'package:batuga/core/domain/services/bluetooth/i_messenger.dart';

final class BluetoothMessenger implements IMessenger {
  BluetoothMessenger({required BBluetoothConnector connector})
    : _connector = connector {
    _incomingRawMessagesSubscription = connector.incomingRawMessageStream
        .listen(_incomingRawMessagesListener);
    _incomingMessagesController = StreamController<Message>.broadcast();
  }

  late StreamSubscription<Uint8List> _incomingRawMessagesSubscription;

  final BBluetoothConnector _connector;
  late final StreamController<Message> _incomingMessagesController;

  @override
  void close() => _incomingRawMessagesSubscription.cancel();

  @override
  Stream<Message> get messages => _incomingMessagesController.stream;

  @override
  Future<void> sendMessage(Message message) async {
    print('📤 Запрос на отправку сообщения ${message.runtimeType}');
    _connector.sendRawMessage(
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
      print('📥 Входящее сообщение: $message');
      _incomingMessagesController.add(
        MessageDto.fromJson(jsonDecode(message)).toDomain(),
      );
    } catch (e) {
      print('❌ Ошибка обработки входящих данных: $e');
    }
  }
}
