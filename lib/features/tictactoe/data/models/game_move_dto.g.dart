// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_move_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameMoveDto _$GameMoveDtoFromJson(Map<String, dynamic> json) => GameMoveDto(
  position: GamePositionDto.fromJson(json['position'] as Map<String, dynamic>),
  playerType: json['player_type'] as String,
);

Map<String, dynamic> _$GameMoveDtoToJson(GameMoveDto instance) =>
    <String, dynamic>{
      'position': instance.position.toJson(),
      'player_type': instance.playerType,
    };
