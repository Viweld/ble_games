import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/models/enums/player_type.dart';
import '../../domain/models/game_move.dart';
import '../../../../core/data/dto/abstracts/base_dto.dart';
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
  final String playerType;

  factory GameMoveDto.fromJson(Map<String, dynamic> json) =>
      _$GameMoveDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GameMoveDtoToJson(this);

  @override
  GameMove toDomain() => GameMove(
    position: position.toDomain(),
    playerType: _playerTypeToEnum(playerType),
  );

  static GameMoveDto fromDomain(GameMove move) => GameMoveDto(
    position: GamePositionDto.fromDomain(move.position),
    playerType: _playerTypeToString(move.playerType),
  );

  // ВСПОМОГАТЕЛЬНЫЕ МЕТОДЫ:
  // ---------------------------------------------------------------------------
  /// Преобразует перечисление PlayerType в строку
  static String _playerTypeToString(PlayerType playerTypeEnum) {
    return switch (playerTypeEnum) {
      PlayerType.x => 'x',
      PlayerType.o => 'o',
    };
  }

  /// Преобразует строку в перечисление PlayerType
  static PlayerType _playerTypeToEnum(String playerTypeString) {
    return switch (playerTypeString) {
      'x' => PlayerType.x,
      'o' => PlayerType.o,
      _ => throw ArgumentError('Unknown player type: $playerTypeString'),
    };
  }
}
