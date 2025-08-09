import 'package:bluetooth_toe/core/data/dto/user_dto.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'abstracts/base_dto.dart';
import '../../domain/models/device.dart';

part 'device_dto.g.dart';

/// DTO устройства
@immutable
@JsonSerializable(explicitToJson: true)
class DeviceDto extends BaseDto<Device> {
  /// Конструктор DTO устройства
  const DeviceDto({required this.id, required this.name, required this.user});

  /// Уникальный идентификатор устройства.
  /// Пример: `"device_456"`
  @JsonKey(name: 'id')
  final String id;

  /// Название устройства.
  /// Пример: `"Samsung Galaxy S21"`
  @JsonKey(name: 'name')
  final String name;

  /// Владелец устройства.
  /// Пример: `{ "id": "user_123", "name": "Иван Иванов" }`
  @JsonKey(name: 'user')
  final UserDto user;

  factory DeviceDto.fromJson(Map<String, dynamic> json) =>
      _$DeviceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceDtoToJson(this);

  @override
  Device toDomain() => Device(id: id, name: name, user: user.toDomain());

  static DeviceDto fromDomain(Device device) => DeviceDto(
    id: device.id,
    name: device.name,
    user: UserDto.fromDomain(device.user),
  );
}
