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
/// Идёт ожидание подтверждения подключения (например, клиент ожидает ответ сервера).
final class TransportSessionAwaitingConfirmation extends TransportSessionState {
  const TransportSessionAwaitingConfirmation({
    required super.localPeer,
    required this.remotePeer,
  });

  /// Удаленный участник сессии
  final PeerEndpoint remotePeer;
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
