import '../models/messages.dart';
import 'models/transport_session_state.dart';

/// Интерфейс сессии транспортного соединения
abstract interface class ITransportSession {
  /// Текущее состояние подключения
  TransportSessionState? get currentConnectionState;

  /// Поток состояний подключения
  Stream<TransportSessionState> get connectionStateStream;

  /// Поток входящих сообщений
  Stream<Message> get messagesStream;

  /// Отправить сообщение
  Future<void> sendMessage(Message message);

  /// Отправить сообщение
  Future<void> disconnect();

  /// Освободить ресурсы
  Future<void> dispose();
}
