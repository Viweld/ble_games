import 'package:bluetooth_toe/core/domain/models/user.dart';
import 'package:flutter/foundation.dart';
import '../../../features/game/domain/models/game_move.dart';
import 'device.dart';

@immutable
sealed class Message {
  const Message({required this.device, required this.user});

  final Device device;
  final User user;
}

/// Приглашение к подключению
@immutable
class InvitationMessage extends Message {
  const InvitationMessage({required super.device, required super.user});
}

/// Согласие на подключение
@immutable
class AcceptanceMessage extends Message {
  const AcceptanceMessage({required super.device, required super.user});
}

/// Отказ от подключения
@immutable
class RejectionMessage extends Message {
  const RejectionMessage({required super.device, required super.user});
}

/// Одностороннее прекращение соединения
@immutable
class TerminationMessage extends Message {
  const TerminationMessage({required super.device, required super.user});
}

/// Сообщение о ходе в игре
@immutable
class MoveMessage extends Message {
  const MoveMessage({
    required super.device,
    required super.user,
    required this.move,
  });

  /// Устройство, отправившее ход и параметры хода
  final GameMove move;
}
