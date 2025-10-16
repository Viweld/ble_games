import '../models/messages.dart';
import 'i_transport_session.dart';
import 'i_transport_session_client.dart';
import 'i_transport_session_server.dart';
import 'models/transport_session_state.dart';

/// Фасад для управления транспортом данных
abstract interface class ITransportFacade {
  /// Поток входящих сообщений
  Stream<Message> get messagesStream;

  /// Отправить сообщение
  Future<void> sendMessage(Message message);

  /// Поток состояни
  Stream<TransportSessionState> get connectionStateStream;

  /// Текущий активный менеджер подключений
  ITransportSession get transportSession;

  /// Запустить транспорт в режиме клиента
  Future<ITransportSessionClient> startClientTransportSession();

  /// Запустить транспорт в режиме сервера
  Future<ITransportSessionServer> startServerTransportSession();

  /// Освободить ресурсы
  Future<void> dispose();
}
