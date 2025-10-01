/// Интерфейс сервиса для управления состоянием Bluetooth
abstract interface class IBluetoothStateService {
  /// Инициализация сервиса (проверка состояния Bluetooth и т.д.)
  Future<void> initialize();

  /// Проверяет, включен ли Bluetooth
  Future<bool> isBluetoothEnabled();

  /// Запрашивает у пользователя включение Bluetooth
  /// Возвращает true, если Bluetooth включен, иначе false
  Future<bool> enableBluetooth();
}
