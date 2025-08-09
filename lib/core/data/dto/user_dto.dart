import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'abstracts/base_dto.dart';
import '../../domain/models/user.dart';

part 'user_dto.g.dart';

/// DTO пользователя
@immutable
@JsonSerializable(explicitToJson: true)
class UserDto extends BaseDto<User> {
  /// Конструктор DTO пользователя
  const UserDto({required this.id, required this.name});

  /// Уникальный идентификатор пользователя.
  /// Пример: `"user_123"`
  @JsonKey(name: 'id')
  final String id;

  /// Имя пользователя для отображения.
  /// Пример: `"Иван Иванов"`
  @JsonKey(name: 'name')
  final String name;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  @override
  User toDomain() => User(id: id, name: name);

  static UserDto fromDomain(User user) => UserDto(id: user.id, name: user.name);
}
