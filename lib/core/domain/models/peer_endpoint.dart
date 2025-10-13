import 'package:batuga/core/domain/models/user.dart';
import 'package:flutter/foundation.dart';

import 'device.dart';

@immutable
class PeerEndpoint {
  const PeerEndpoint({required this.user, required this.device});

  /// Данные о пользователе
  final User user;

  /// Данные об устройстве пользователя
  final Device device;
}
