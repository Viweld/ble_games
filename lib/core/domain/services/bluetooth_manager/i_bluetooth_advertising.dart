/// Интерфейс сервиса рекламы (peripheral mode)
abstract interface class IBluetoothAdvertising {
  /// Поток подключений клиентов (central устройств)
  Stream<String> get clientConnections;

  /// Начать рекламу присутствия приложения (BLE Advertise)
  Future<void> startAdvertising();

  /// Остановить рекламу присутствия приложения (BLE Advertise)
  Future<void> stopAdvertising();
}
