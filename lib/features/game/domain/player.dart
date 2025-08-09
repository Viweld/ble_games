import 'package:freezed_annotation/freezed_annotation.dart';

/// Доменная модель игрока
@immutable
class Player {
  const Player({
    required this.id,
    required this.nickname,
    required this.deviceId,
    required this.deviceName,
  });

  final String id;
  final String nickname;
  final String deviceId;
  final String deviceName;
}
