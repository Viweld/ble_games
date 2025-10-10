import '../models/device.dart';

/// Интерфейс сессии транспортного соединения со стороны клиента
abstract interface class ITransportSessionClient {
  /// Поток обнаруженных устройств
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
