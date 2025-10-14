import 'package:batuga/core/domain/models/peer_endpoint.dart';

/// Базовый тип состояний транспортной сессии
sealed class TransportSessionState {
  const TransportSessionState({required this.localPeer});

  /// Местный участник сессии
  final PeerEndpoint localPeer;
}

// -----------------------------------------------------------------------------
/// Сессия неактивна или завершена.
final class TransportSessionDisconnected extends TransportSessionState {
  const TransportSessionDisconnected({required super.localPeer});
}

// -----------------------------------------------------------------------------
/// Получено приглашение от клиента и теперь ожидается подтверждение от пользователя
final class TransportSessionAwaitingUserDecision extends TransportSessionState {
  const TransportSessionAwaitingUserDecision({
    required super.localPeer,
    required this.remotePeer,
  });

  /// Удаленный участник сессии
  final PeerEndpoint remotePeer;
}

// -----------------------------------------------------------------------------
/// Отправлено приглашение на сервер и теперь ожидается подтверждение на удаленном устройстве
final class TransportSessionAwaitingRemoteDecision
    extends TransportSessionState {
  const TransportSessionAwaitingRemoteDecision({required super.localPeer});
}

// -----------------------------------------------------------------------------
/// Сессия установлена — соединение активно.
final class TransportSessionConnected extends TransportSessionState {
  const TransportSessionConnected({
    required super.localPeer,
    required this.remotePeer,
  });

  /// Удаленный участник сессии
  final PeerEndpoint remotePeer;
}
