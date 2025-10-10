import '../models/device.dart';

/// Интерфейс клиента для управления транспортным соединением (например, Bluetooth)
abstract interface class ITransportLinkClient {
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
