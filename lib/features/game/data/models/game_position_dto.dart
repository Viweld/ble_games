import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/data/dto/abstracts/base_dto.dart';
import '../../domain/models/game_position.dart';

part 'game_position_dto.g.dart';

/// DTO позиции на поле
@immutable
@JsonSerializable(explicitToJson: true)
class GamePositionDto extends BaseDto<GamePosition> {
  /// Конструктор DTO позиции
  const GamePositionDto({required this.row, required this.column});

  /// Номер строки на игровом поле
  /// Пример: `0`
  @JsonKey(name: 'row')
  final int row;

  /// Номер колонки на игровом поле
  /// Пример: `2`
  @JsonKey(name: 'column')
  final int column;

  factory GamePositionDto.fromJson(Map<String, dynamic> json) =>
      _$GamePositionDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GamePositionDtoToJson(this);

  @override
  GamePosition toDomain() => GamePosition(row: row, column: column);

  static GamePositionDto fromDomain(GamePosition position) =>
      GamePositionDto(row: position.row, column: position.column);
}
