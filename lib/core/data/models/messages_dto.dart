import 'package:batuga/features/tictactoe/data/models/game_move_dto.dart'
    as game_move_dto;
import 'package:batuga/core/data/models/user_dto.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../features/tictactoe/data/models/game_move_dto.dart';
import 'abstracts/base_dto.dart';
import '../../domain/models/messages.dart';
import 'device_dto.dart';
import '../../../features/tictactoe/domain/models/enums/player_type.dart';

part 'messages_dto.g.dart';

/// Базовый DTO для сообщений
@immutable
abstract class MessageDto<T extends Message> extends BaseDto<T> {
  /// Конструктор базового DTO для сообщений
  const MessageDto({
    required this.device,
    required this.type,
    required this.user,
  });

  static const String typeKey = 'type';
  static const String deviceKey = 'device';
  static const String userKey = 'user';

  /// Тип сообщения (используется для определения класса-наследника при десериализации).
  /// Пример: `"invitation"`, `"acceptance"`, `"rejection"`, `"termination"`
  @JsonKey(name: typeKey)
  final String type;

  /// Устройство, связанное с сообщением.
  /// Пример: `{ "id": "device_456", "name": "Samsung Galaxy S21" }`
  @JsonKey(name: deviceKey)
  final DeviceDto device;

  /// Владелец устройства.
  /// Пример: `{ "id": "user_123", "name": "Иван Иванов" }`
  @JsonKey(name: userKey)
  final UserDto user;

  /// Универсальная фабрика для создания конкретного наследника MessageDto
  static MessageDto fromJson(Map<String, dynamic> json) => switch (json[typeKey]
      as String) {
    InvitationMessageDto.typeValue => InvitationMessageDto.fromJson(json),
    AcceptanceMessageDto.typeValue => AcceptanceMessageDto.fromJson(json),
    RejectionMessageDto.typeValue => RejectionMessageDto.fromJson(json),
    TerminationMessageDto.typeValue => TerminationMessageDto.fromJson(json),
    MoveMessageDto.typeValue => MoveMessageDto.fromJson(json),
    RoleAssignmentMessageDto.typeValue => RoleAssignmentMessageDto.fromJson(
      json,
    ),
    OpponentLeftMessageDto.typeValue => OpponentLeftMessageDto.fromJson(json),
    _ => throw ArgumentError('Unknown message type: ${json[typeKey]}'),
  };

  /// Универсальная фабрика для создания конкретного наследника MessageDto из доменной модели
  static MessageDto fromDomain(Message message) => switch (message) {
    InvitationMessage m => InvitationMessageDto.fromDomain(m),
    AcceptanceMessage m => AcceptanceMessageDto.fromDomain(m),
    RejectionMessage m => RejectionMessageDto.fromDomain(m),
    TerminationMessage m => TerminationMessageDto.fromDomain(m),
    MoveMessage m => MoveMessageDto.fromDomain(m),
    RoleAssignmentMessage m => RoleAssignmentMessageDto.fromDomain(m),
    OpponentLeftMessage m => OpponentLeftMessageDto.fromDomain(m),
  };
}

// -----------------------------------------------------------------------------
/// DTO приглашения к подключению
@immutable
@JsonSerializable(explicitToJson: true)
class InvitationMessageDto extends MessageDto<InvitationMessage> {
  const InvitationMessageDto({
    required super.type,
    required super.device,
    required super.user,
  });

  static const String typeValue = 'invitation';

  factory InvitationMessageDto.fromJson(Map<String, dynamic> json) =>
      _$InvitationMessageDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InvitationMessageDtoToJson(this);

  @override
  InvitationMessage toDomain() =>
      InvitationMessage(device: device.toDomain(), user: user.toDomain());

  static InvitationMessageDto fromDomain(InvitationMessage message) =>
      InvitationMessageDto(
        type: typeValue,
        device: DeviceDto.fromDomain(message.device),
        user: UserDto.fromDomain(message.user),
      );
}

// -----------------------------------------------------------------------------
/// DTO согласия на подключение
@immutable
@JsonSerializable(explicitToJson: true)
class AcceptanceMessageDto extends MessageDto<AcceptanceMessage> {
  const AcceptanceMessageDto({
    required super.type,
    required super.device,
    required super.user,
  });

  static const String typeValue = 'acceptance';

  factory AcceptanceMessageDto.fromJson(Map<String, dynamic> json) =>
      _$AcceptanceMessageDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AcceptanceMessageDtoToJson(this);

  @override
  AcceptanceMessage toDomain() =>
      AcceptanceMessage(device: device.toDomain(), user: user.toDomain());

  static AcceptanceMessageDto fromDomain(AcceptanceMessage message) =>
      AcceptanceMessageDto(
        type: typeValue,
        device: DeviceDto.fromDomain(message.device),
        user: UserDto.fromDomain(message.user),
      );
}

// -----------------------------------------------------------------------------
/// DTO отказа от подключения
@immutable
@JsonSerializable(explicitToJson: true)
class RejectionMessageDto extends MessageDto<RejectionMessage> {
  const RejectionMessageDto({
    required super.type,
    required super.device,
    required super.user,
  });

  static const String typeValue = 'rejection';

  factory RejectionMessageDto.fromJson(Map<String, dynamic> json) =>
      _$RejectionMessageDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RejectionMessageDtoToJson(this);

  @override
  RejectionMessage toDomain() =>
      RejectionMessage(device: device.toDomain(), user: user.toDomain());

  static RejectionMessageDto fromDomain(RejectionMessage message) =>
      RejectionMessageDto(
        type: typeValue,
        device: DeviceDto.fromDomain(message.device),
        user: UserDto.fromDomain(message.user),
      );
}

// -----------------------------------------------------------------------------
/// DTO одностороннего прекращения соединения
@immutable
@JsonSerializable(explicitToJson: true)
class TerminationMessageDto extends MessageDto<TerminationMessage> {
  const TerminationMessageDto({
    required super.type,
    required super.device,
    required super.user,
  });

  static const String typeValue = 'termination';

  factory TerminationMessageDto.fromJson(Map<String, dynamic> json) =>
      _$TerminationMessageDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TerminationMessageDtoToJson(this);

  @override
  TerminationMessage toDomain() =>
      TerminationMessage(device: device.toDomain(), user: user.toDomain());

  static TerminationMessageDto fromDomain(TerminationMessage message) =>
      TerminationMessageDto(
        type: typeValue,
        device: DeviceDto.fromDomain(message.device),
        user: UserDto.fromDomain(message.user),
      );
}

// -----------------------------------------------------------------------------
/// DTO одностороннего прекращения соединения
@immutable
@JsonSerializable(explicitToJson: true)
class MoveMessageDto extends MessageDto<MoveMessage> {
  const MoveMessageDto({
    required super.type,
    required super.device,
    required super.user,
    required this.move,
  });

  static const String typeValue = 'move';
  static const String moveKey = 'move';

  /// Ход в игре, связанный с сообщением
  /// Пример: `{ "position": { "row": 0, "column": 2 }, "player_type": "X" }`
  @JsonKey(name: moveKey)
  final game_move_dto.GameMoveDto move;

  factory MoveMessageDto.fromJson(Map<String, dynamic> json) =>
      _$MoveMessageDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MoveMessageDtoToJson(this);

  @override
  MoveMessage toDomain() => MoveMessage(
    device: device.toDomain(),
    move: move.toDomain(),
    user: user.toDomain(),
  );

  static MoveMessageDto fromDomain(MoveMessage message) => MoveMessageDto(
    type: typeValue,
    device: DeviceDto.fromDomain(message.device),
    user: UserDto.fromDomain(message.user),
    move: game_move_dto.GameMoveDto.fromDomain(message.move),
  );
}

// -----------------------------------------------------------------------------
/// DTO назначения роли игрока
@immutable
@JsonSerializable(explicitToJson: true)
class RoleAssignmentMessageDto extends MessageDto<RoleAssignmentMessage> {
  const RoleAssignmentMessageDto({
    required super.type,
    required super.device,
    required super.user,
    required this.assignedType,
  });

  static const String typeValue = 'role_assignment';
  static const String assignedTypeKey = 'assigned_type';

  @JsonKey(name: assignedTypeKey)
  final String assignedType;

  factory RoleAssignmentMessageDto.fromJson(Map<String, dynamic> json) =>
      _$RoleAssignmentMessageDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RoleAssignmentMessageDtoToJson(this);

  @override
  RoleAssignmentMessage toDomain() => RoleAssignmentMessage(
    device: device.toDomain(),
    user: user.toDomain(),
    assignedType: PlayerType.values.firstWhere(
      (e) => e.name == assignedType,
      orElse: () => PlayerType.x,
    ),
  );

  static RoleAssignmentMessageDto fromDomain(RoleAssignmentMessage message) =>
      RoleAssignmentMessageDto(
        type: typeValue,
        device: DeviceDto.fromDomain(message.device),
        user: UserDto.fromDomain(message.user),
        assignedType: message.assignedType.name,
      );
}

// -----------------------------------------------------------------------------
/// DTO выхода соперника из игры
@immutable
@JsonSerializable(explicitToJson: true)
class OpponentLeftMessageDto extends MessageDto<OpponentLeftMessage> {
  const OpponentLeftMessageDto({
    required super.type,
    required super.device,
    required super.user,
  });

  static const String typeValue = 'opponent_left';

  factory OpponentLeftMessageDto.fromJson(Map<String, dynamic> json) =>
      _$OpponentLeftMessageDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$OpponentLeftMessageDtoToJson(this);

  @override
  OpponentLeftMessage toDomain() =>
      OpponentLeftMessage(device: device.toDomain(), user: user.toDomain());

  static OpponentLeftMessageDto fromDomain(OpponentLeftMessage message) =>
      OpponentLeftMessageDto(
        type: typeValue,
        device: DeviceDto.fromDomain(message.device),
        user: UserDto.fromDomain(message.user),
      );
}
