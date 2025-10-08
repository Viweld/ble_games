import '../../models/messages.dart';

/// Интерфейс сервиса обмена сообщениями.
/// Преобразует сырые данные в сообщения и наоборот.
abstract interface class IMessenger {
  /// Закрыть мессенджер
  void close();

  /// Поток входящих сообщений
  Stream<Message> get messages;

  /// Отправить сообщение
  Future<void> sendMessage(Message message);
}
