import 'package:batuga/core/data/models/user_dto.dart';
import 'package:batuga/core/domain/models/peer_endpoint.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'abstracts/base_dto.dart';
import 'device_dto.dart';

part 'peer_endpoint_dto.g.dart';

/// DTO участника сессии
@immutable
@JsonSerializable(explicitToJson: true)
class PeerEndpointDto extends BaseDto<PeerEndpoint> {
  const PeerEndpointDto({required this.user, required this.device});

  /// Данные пользователя
  /// Пример: "user": {}
  @JsonKey(name: 'user')
  final UserDto user;

  /// Данные устройства
  /// Пример: "device": {}
  @JsonKey(name: 'device')
  final DeviceDto device;

  factory PeerEndpointDto.fromJson(Map<String, dynamic> json) =>
      _$PeerEndpointDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PeerEndpointDtoToJson(this);

  @override
  PeerEndpoint toDomain() =>
      PeerEndpoint(user: user.toDomain(), device: device.toDomain());

  static PeerEndpointDto fromDomain(PeerEndpoint p) => PeerEndpointDto(
    user: UserDto.fromDomain(p.user),
    device: DeviceDto.fromDomain(p.device),
  );
}
