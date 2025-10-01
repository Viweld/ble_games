/// Сервис для проверки и запроса Bluetooth разрешений
abstract interface class IBluetoothPermissionsService {
  /// Проверяет, предоставлены ли все необходимые Bluetooth разрешения. Если может запрашивает их.
  /// Возвращает true, если все необходимые разрешения предоставлены, иначе false.
  Future<bool> checkPermissions();

  /// Открывает настройки приложения для предоставления разрешений вручную
  Future<bool> openAppSettings();
}
