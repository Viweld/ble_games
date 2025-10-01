import '../models/device.dart';

/// Интерфейс сервиса сканирования bluetooth-устройств
abstract interface class IBluetoothDiscoveryService {
  /// Поток найденных устройств
  Stream<List<Device>> get discoveredDevices;

  /// Начать сканирование устройств
  Future<void> startDiscovery();

  /// Остановить сканирование устройств
  Future<void> stopDiscovery();

  /// Обновить сканирование устройств (перезапустить)
  Future<void> refreshDiscovery();
}
