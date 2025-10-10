/// Интерфейс сессии транспортного соединения со стороны сервера
abstract interface class ITransportSessionServer {
  /// Начать рекламу присутствия приложения
  Future<void> startAdvertising();

  /// Остановить рекламу присутствия приложения
  Future<void> stopAdvertising();

  /// Подтвердить запрос на подключение
  Future<void> confirmConnectionRequest();

  /// Отклонить запрос на подключение
  Future<void> rejectConnectionRequest();
}
