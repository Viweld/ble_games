/// Интерфейс сервиса для управления состоянием Bluetooth
abstract interface class IBluetoothStateService {
  /// Проверяет, включен ли Bluetooth
  Future<bool> isBluetoothEnabled();

  /// Запрашивает у пользователя включение Bluetooth
  /// Возвращает true, если Bluetooth включен, иначе false
  Future<bool> enableBluetooth();
}
