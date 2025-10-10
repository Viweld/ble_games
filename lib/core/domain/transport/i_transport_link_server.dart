/// Интерфейс сервера для управления Bluetooth-соединениями
abstract interface class ITransportLinkServer {
  /// Начать рекламу присутствия приложения
  Future<void> startAdvertising();

  /// Остановить рекламу присутствия приложения
  Future<void> stopAdvertising();

  /// Подтвердить запрос на подключение
  Future<void> confirmConnectionRequest();

  /// Отклонить запрос на подключение
  Future<void> rejectConnectionRequest();
}
