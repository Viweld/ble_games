import 'package:batuga/core/domain/models/peer_endpoint.dart';
import 'package:flutter/foundation.dart';
import '../../../features/tictactoe/domain/models/game_move.dart';
import '../../../features/tictactoe/domain/models/enums/player_type.dart';

@immutable
sealed class Message {
  const Message({required this.peerEndpoint});

  final PeerEndpoint peerEndpoint;
}

/// Приглашение к подключению
@immutable
final class InvitationMessage extends Message {
  const InvitationMessage({required super.peerEndpoint});
}

/// Согласие на подключение
@immutable
final class AcceptanceMessage extends Message {
  const AcceptanceMessage({required super.peerEndpoint});
}

/// Отказ от подключения
@immutable
final class RejectionMessage extends Message {
  const RejectionMessage({required super.peerEndpoint});
}

/// Одностороннее прекращение соединения
@immutable
final class DisconnectionMessage extends Message {
  const DisconnectionMessage({required super.peerEndpoint});
}

/// Сообщение о ходе в игре
@immutable
final class MoveMessage extends Message {
  const MoveMessage({required super.peerEndpoint, required this.move});

  /// Устройство, отправившее ход и параметры хода
  final GameMove move;
}

/// Назначение роли игрока перед началом партии
@immutable
final class RoleAssignmentMessage extends Message {
  const RoleAssignmentMessage({
    required super.peerEndpoint,
    required this.assignedType,
  });

  final PlayerType assignedType;
}

/// Соперник вышел из игры (в пределах активного соединения)
@immutable
final class OpponentLeftMessage extends Message {
  const OpponentLeftMessage({required super.peerEndpoint});
}
