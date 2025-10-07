import '../../models/messages.dart';

/// Интерфейс сервиса обмена сообщениями
abstract interface class IMessenger {
  /// Поток входящих сообщений
  Stream<Message> get messages;

  /// Отправить сообщение
  Future<void> sendMessage(Message message);
}
