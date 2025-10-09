import '../../models/device.dart';

/// Интерфейс сервиса сканирования bluetooth-устройств
abstract interface class IConnectorClient {
  /// Поток найденных устройств
  Stream<List<Device>> get discoveredDevicesStream;

  /// Начать сканирование устройств
  Future<void> startDiscovery();

  /// Остановить сканирование устройств
  Future<void> stopDiscovery();

  /// Обновить сканирование устройств (перезапустить)
  Future<void> refreshDiscovery();

  /// Подключиться к устройству
  Future<void> connectToDevice(Device device);
}
