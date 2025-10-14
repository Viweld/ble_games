import '../models/device.dart';

/// Интерфейс репозитория устройства
abstract class IDeviceRepository {
  /// Получение имени устройства
  Future<String> getDeviceName();

  /// Получение данных текущего устройства
  Future<Device> getDevice();
}
