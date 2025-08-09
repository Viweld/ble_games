import 'package:flutter/foundation.dart';
import '../../../features/game/domain/game_move.dart';
import 'device.dart';

@immutable
sealed class Message {
  const Message({required this.device});

  final Device device;
}

/// Приглашение к подключению
@immutable
class InvitationMessage extends Message {
  const InvitationMessage({required super.device});
}

/// Согласие на подключение
@immutable
class AcceptanceMessage extends Message {
  const AcceptanceMessage({required super.device});
}

/// Отказ от подключения
@immutable
class RejectionMessage extends Message {
  const RejectionMessage({required super.device});
}

/// Одностороннее прекращение соединения
@immutable
class TerminationMessage extends Message {
  const TerminationMessage({required super.device});
}

/// Сообщение о ходе в игре
@immutable
class MoveMessage extends Message {
  const MoveMessage({required super.device, required this.move});

  /// Устройство, отправившее ход и параметры хода
  final GameMove move;
}
