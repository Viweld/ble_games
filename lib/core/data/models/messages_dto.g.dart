// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvitationMessageDto _$InvitationMessageDtoFromJson(
  Map<String, dynamic> json,
) => InvitationMessageDto(
  type: json['type'] as String,
  peerEndpoint: PeerEndpointDto.fromJson(
    json['peer_endpoint'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$InvitationMessageDtoToJson(
  InvitationMessageDto instance,
) => <String, dynamic>{
  'type': instance.type,
  'peer_endpoint': instance.peerEndpoint.toJson(),
};

AcceptanceMessageDto _$AcceptanceMessageDtoFromJson(
  Map<String, dynamic> json,
) => AcceptanceMessageDto(
  type: json['type'] as String,
  peerEndpoint: PeerEndpointDto.fromJson(
    json['peer_endpoint'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$AcceptanceMessageDtoToJson(
  AcceptanceMessageDto instance,
) => <String, dynamic>{
  'type': instance.type,
  'peer_endpoint': instance.peerEndpoint.toJson(),
};

RejectionMessageDto _$RejectionMessageDtoFromJson(Map<String, dynamic> json) =>
    RejectionMessageDto(
      type: json['type'] as String,
      peerEndpoint: PeerEndpointDto.fromJson(
        json['peer_endpoint'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$RejectionMessageDtoToJson(
  RejectionMessageDto instance,
) => <String, dynamic>{
  'type': instance.type,
  'peer_endpoint': instance.peerEndpoint.toJson(),
};

TerminationMessageDto _$TerminationMessageDtoFromJson(
  Map<String, dynamic> json,
) => TerminationMessageDto(
  type: json['type'] as String,
  peerEndpoint: PeerEndpointDto.fromJson(
    json['peer_endpoint'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$TerminationMessageDtoToJson(
  TerminationMessageDto instance,
) => <String, dynamic>{
  'type': instance.type,
  'peer_endpoint': instance.peerEndpoint.toJson(),
};

MoveMessageDto _$MoveMessageDtoFromJson(Map<String, dynamic> json) =>
    MoveMessageDto(
      type: json['type'] as String,
      peerEndpoint: PeerEndpointDto.fromJson(
        json['peer_endpoint'] as Map<String, dynamic>,
      ),
      move: GameMoveDto.fromJson(json['move'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MoveMessageDtoToJson(MoveMessageDto instance) =>
    <String, dynamic>{
      'type': instance.type,
      'peer_endpoint': instance.peerEndpoint.toJson(),
      'move': instance.move.toJson(),
    };

RoleAssignmentMessageDto _$RoleAssignmentMessageDtoFromJson(
  Map<String, dynamic> json,
) => RoleAssignmentMessageDto(
  type: json['type'] as String,
  peerEndpoint: PeerEndpointDto.fromJson(
    json['peer_endpoint'] as Map<String, dynamic>,
  ),
  assignedType: json['assigned_type'] as String,
);

Map<String, dynamic> _$RoleAssignmentMessageDtoToJson(
  RoleAssignmentMessageDto instance,
) => <String, dynamic>{
  'type': instance.type,
  'peer_endpoint': instance.peerEndpoint.toJson(),
  'assigned_type': instance.assignedType,
};

OpponentLeftMessageDto _$OpponentLeftMessageDtoFromJson(
  Map<String, dynamic> json,
) => OpponentLeftMessageDto(
  type: json['type'] as String,
  peerEndpoint: PeerEndpointDto.fromJson(
    json['peer_endpoint'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$OpponentLeftMessageDtoToJson(
  OpponentLeftMessageDto instance,
) => <String, dynamic>{
  'type': instance.type,
  'peer_endpoint': instance.peerEndpoint.toJson(),
};
