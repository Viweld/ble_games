/// Интерфейс сервера для работы с Bluetooth соединением
abstract interface class IConnectorServer {
  /// Начать рекламу присутствия приложения
  Future<void> startAdvertising();

  /// Остановить рекламу присутствия приложения
  Future<void> stopAdvertising();

  /// Подтвердить запрос на подключение
  Future<void> confirmConnectionRequest();

  /// Отклонить запрос на подключение
  Future<void> rejectConnectionRequest();
}
