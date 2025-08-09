// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvitationMessageDto _$InvitationMessageDtoFromJson(
  Map<String, dynamic> json,
) => InvitationMessageDto(
  type: json['type'] as String,
  device: DeviceDto.fromJson(json['device'] as Map<String, dynamic>),
);

Map<String, dynamic> _$InvitationMessageDtoToJson(
  InvitationMessageDto instance,
) => <String, dynamic>{
  'type': instance.type,
  'device': instance.device.toJson(),
};

AcceptanceMessageDto _$AcceptanceMessageDtoFromJson(
  Map<String, dynamic> json,
) => AcceptanceMessageDto(
  type: json['type'] as String,
  device: DeviceDto.fromJson(json['device'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AcceptanceMessageDtoToJson(
  AcceptanceMessageDto instance,
) => <String, dynamic>{
  'type': instance.type,
  'device': instance.device.toJson(),
};

RejectionMessageDto _$RejectionMessageDtoFromJson(Map<String, dynamic> json) =>
    RejectionMessageDto(
      type: json['type'] as String,
      device: DeviceDto.fromJson(json['device'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RejectionMessageDtoToJson(
  RejectionMessageDto instance,
) => <String, dynamic>{
  'type': instance.type,
  'device': instance.device.toJson(),
};

TerminationMessageDto _$TerminationMessageDtoFromJson(
  Map<String, dynamic> json,
) => TerminationMessageDto(
  type: json['type'] as String,
  device: DeviceDto.fromJson(json['device'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TerminationMessageDtoToJson(
  TerminationMessageDto instance,
) => <String, dynamic>{
  'type': instance.type,
  'device': instance.device.toJson(),
};

MoveMessageDto _$MoveMessageDtoFromJson(Map<String, dynamic> json) =>
    MoveMessageDto(
      type: json['type'] as String,
      device: DeviceDto.fromJson(json['device'] as Map<String, dynamic>),
      move: GameMoveDto.fromJson(json['move'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MoveMessageDtoToJson(MoveMessageDto instance) =>
    <String, dynamic>{
      'type': instance.type,
      'device': instance.device.toJson(),
      'move': instance.move.toJson(),
    };
