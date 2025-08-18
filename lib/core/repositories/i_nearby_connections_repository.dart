import '../domain/models/device.dart';
import '../domain/models/messages.dart';

/// Интерфейс репозитория Nearby Connections
abstract class INearbyConnectionsRepository {
  /// Инициализация репозитория
  Future<void> initialize();

  /// Начать поиск устройств
  Future<void> startDiscovery();

  /// Остановить поиск устройств
  Future<void> stopDiscovery();

  /// Начать рекламу
  Future<void> startAdvertising();

  /// Остановить рекламу
  Future<void> stopAdvertising();

  /// Подключиться к устройству
  Future<void> connectToDevice(Device device);

  /// Отключиться от всех устройств
  Future<void> disconnect();

  /// Отправить сообщение
  Future<void> sendMessage(Message message);

  /// Поток входящих сообщений
  Stream<Message> get incomingMessages;

  /// Проверить, есть ли активное соединение
  bool get isConnected;

  /// Получить подключенное устройство
  Device? get connectedDevice;

  /// Освободить ресурсы
  void dispose();
}
