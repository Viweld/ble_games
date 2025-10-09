/// Интерфейс логгера для логирования сообщений различного уровня.
abstract interface class ILogger {
  /// Логирование информационных сообщений
  void d(String message);

  /// Логирование предупреждающих сообщений
  void w(String message);

  /// Логирование сообщений об ошибках
  void e(String message);
}
