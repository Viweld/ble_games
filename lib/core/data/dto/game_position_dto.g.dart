// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_position_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GamePositionDto _$GamePositionDtoFromJson(Map<String, dynamic> json) =>
    GamePositionDto(
      row: (json['row'] as num).toInt(),
      column: (json['column'] as num).toInt(),
    );

Map<String, dynamic> _$GamePositionDtoToJson(GamePositionDto instance) =>
    <String, dynamic>{'row': instance.row, 'column': instance.column};
