/// Константы приложения
class AppConstants {
  const AppConstants._();

  /// Минимальная длина псевдонима
  static const int minNicknameLength = 3;

  /// Размер игрового поля
  static const int gameFieldSize = 3;

  /// Размер шрифта для уведомлений о ходе
  static const double turnNotificationFontSize = 56.0;

  /// Задержка для сплэш-скрина (в миллисекундах)
  static const int splashDelayMs = 2000;

  /// Таймаут для Bluetooth соединения (в миллисекундах)
  static const int bluetoothTimeoutMs = 10000;

  /// Идентификатор приложения для Bluetooth
  static const String appBluetoothId = 'bluetooth_toe_app';

  /// Префикс для Bluetooth устройств
  static const String bluetoothDevicePrefix = 'BT_TOE_';
}
