import '../models/messages.dart';
import 'i_transport_session.dart';
import 'i_transport_session_client.dart';
import 'i_transport_session_server.dart';

/// Фасад для управления транспортом данных
abstract interface class ITransportFacade {
  /// Поток входящих сообщений
  Stream<Message> get messagesStream;

  /// Отправить сообщение
  Future<void> sendMessage(Message message);

  /// Клиентская часть менеджера подключений
  ITransportSessionClient get connectionManagerClient;

  /// Серверная часть менеджера подключений
  ITransportSessionServer get connectionManagerServer;

  /// Текущий активный менеджер подключений (если есть)
  ITransportSession? get connectionManager;

  /// Запустить транспорт в режиме клиента
  void initializeClient();

  /// Запустить транспорт в режиме сервера
  void initializeServer();

  /// Освободить ресурсы
  Future<void> dispose();
}
