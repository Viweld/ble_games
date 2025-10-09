import 'package:batuga/core/domain/transport/bluetooth/i_messenger.dart';

import '../../models/device.dart';
import 'b_bluetooth_connection_manager.dart';
import 'connection_states.dart';
import 'i_connection_manager.dart';

/// Интерфейс сервиса управления Bluetooth подключениями (сервер)
abstract interface class IConnectionManagerServer {
  /// Начать рекламу присутствия приложения
  Future<void> startAdvertising();

  /// Остановить рекламу присутствия приложения
  Future<void> stopAdvertising();

  /// Подтвердить запрос на подключение
  Future<void> confirmConnectionRequest();

  /// Отклонить запрос на подключение
  Future<void> rejectConnectionRequest();

  /// Отключиться от устройства
  Future<void> disconnect();
}
