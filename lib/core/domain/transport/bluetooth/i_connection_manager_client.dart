import 'package:batuga/core/domain/transport/bluetooth/i_messenger.dart';

import '../../models/device.dart';
import 'connection_states.dart';

/// Интерфейс сервиса управления Bluetooth подключениями (клиент)
abstract interface class IConnectionManagerClient {
  /// Текущее состояние подключения
  BluetoothConnectionState? get currentConnectionState;

  /// Поток состояний подключения
  Stream<BluetoothConnectionState> get connectionStateStream;

  /// Поток обнаруженных устройств
  Stream<List<Device>> get discoveredDevicesStream;

  /// Мессенджер для обмена сообщениями
  IMessenger get messenger;

  /// Начать сканирование устройств
  Future<void> startDiscovery();

  /// Остановить сканирование устройств
  Future<void> stopDiscovery();

  /// Обновить сканирование устройств (перезапустить)
  Future<void> refreshDiscovery();

  /// Подключиться к устройству
  Future<void> connectToDevice(Device device);

  /// Отключиться от устройства
  Future<void> disconnect();
}
