import '../../models/device.dart';
import '../../models/user.dart';

/// Базовый тип состояний транспортной сессии
sealed class TransportSessionState {}

/// Сессия неактивна или завершена.
final class TransportSessionDisconnected implements TransportSessionState {
  const TransportSessionDisconnected();
}

/// Идёт ожидание подтверждения подключения (например, клиент ожидает ответ сервера).
final class TransportSessionAwaitingConfirmation
    implements TransportSessionState {
  const TransportSessionAwaitingConfirmation();
}

/// Получено приглашение на подключение (например, серверу пришёл запрос от клиента).
final class TransportSessionIncomingRequest implements TransportSessionState {
  const TransportSessionIncomingRequest({
    required this.remoteUser,
    required this.remoteDevice,
  });

  final User remoteUser;
  final Device remoteDevice;
}

/// Сессия установлена — соединение активно.
final class TransportSessionConnected implements TransportSessionState {
  const TransportSessionConnected({
    required this.remoteUser,
    required this.remoteDevice,
  });

  final User remoteUser;
  final Device remoteDevice;
}
