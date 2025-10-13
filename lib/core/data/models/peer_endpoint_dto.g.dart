// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'peer_endpoint_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeerEndpointDto _$PeerEndpointDtoFromJson(Map<String, dynamic> json) =>
    PeerEndpointDto(
      user: UserDto.fromJson(json['user'] as Map<String, dynamic>),
      device: DeviceDto.fromJson(json['device'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PeerEndpointDtoToJson(PeerEndpointDto instance) =>
    <String, dynamic>{
      'user': instance.user.toJson(),
      'device': instance.device.toJson(),
    };
