/// Интерфейс сервиса рекламы (peripheral mode)
abstract interface class IBluetoothAdvertising {
  /// Начать рекламу присутствия приложения (BLE Advertise)
  Future<void> startAdvertising();

  /// Остановить рекламу присутствия приложения (BLE Advertise)
  Future<void> stopAdvertising();
}
