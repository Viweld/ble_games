/// Интерфейс для управления жизненным циклом Bluetooth-менеджера
abstract interface class IBluetoothLifecycle {
  /// Инициализация Bluetooth-менеджера
  Future<void> initialize();

  /// Очистка ресурсов Bluetooth-менеджера
  Future<void> dispose();
}
