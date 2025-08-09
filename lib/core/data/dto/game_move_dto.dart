import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../features/game/domain/enums/player_type.dart';
import '../../../features/game/domain/game_move.dart';
import 'abstracts/base_dto.dart';
import 'game_position_dto.dart';

part 'game_move_dto.g.dart';

/// DTO хода в игре
@immutable
@JsonSerializable(explicitToJson: true)
class GameMoveDto extends BaseDto<GameMove> {
  /// Конструктор DTO хода
  const GameMoveDto({required this.position, required this.playerType});

  /// Позиция, на которую был сделан ход
  @JsonKey(name: 'position')
  final GamePositionDto position;

  /// Тип игрока (например, X или O)
  @JsonKey(name: 'player_type')
  final PlayerType playerType;

  factory GameMoveDto.fromJson(Map<String, dynamic> json) =>
      _$GameMoveDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GameMoveDtoToJson(this);

  @override
  GameMove toDomain() =>
      GameMove(position: position.toDomain(), playerType: playerType);

  static GameMoveDto fromDomain(GameMove move) => GameMoveDto(
    position: GamePositionDto.fromDomain(move.position),
    playerType: move.playerType,
  );
}
