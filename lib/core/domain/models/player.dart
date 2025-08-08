import 'package:freezed_annotation/freezed_annotation.dart';

part 'player.freezed.dart';
part 'player.g.dart';

/// Модель игрока
@freezed
class Player with _$Player {
  const factory Player({
    required String id,
    required String nickname,
    required String deviceId,
    required String deviceName,
  }) = _Player;

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
}
