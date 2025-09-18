import 'package:batuga/core/data/dto/user_dto.dart';
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
  const DeviceDto({
    required this.id,
    required this.name,
    this.isOurApp = false,
  });

  /// Уникальный идентификатор устройства.
  /// Пример: `"device_456"`
  @JsonKey(name: 'id')
  final String id;

  /// Название устройства.
  /// Пример: `"Samsung Galaxy S21"`
  @JsonKey(name: 'name')
  final String name;

  /// Является ли устройство нашим приложением
  @JsonKey(name: 'isOurApp')
  final bool isOurApp;

  factory DeviceDto.fromJson(Map<String, dynamic> json) =>
      _$DeviceDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DeviceDtoToJson(this);

  @override
  Device toDomain() => Device(id: id, name: name, isOurApp: isOurApp);

  static DeviceDto fromDomain(Device device) =>
      DeviceDto(id: device.id, name: device.name, isOurApp: device.isOurApp);
}
