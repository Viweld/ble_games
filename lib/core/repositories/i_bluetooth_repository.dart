import '../domain/models/device.dart';
import '../domain/models/messages.dart';

/// Интерфейс репозитория Bluetooth
abstract class IBluetoothRepository {
  /// Инициализировать Bluetooth
  Future<void> initialize();

  /// Начать поиск устройств
  Future<void> startDiscovery();

  /// Остановить поиск устройств
  Future<void> stopDiscovery();

  /// Обновить поиск устройств (перезапустить сканирование)
  Future<void> refreshDiscovery();

  /// Включить рекламу присутствия приложения (BLE Advertise)
  Future<void> startAdvertising();

  /// Отключить рекламу присутствия приложения (BLE Advertise)
  Future<void> stopAdvertising();

  /// Получить список найденных устройств
  Stream<List<Device>> get discoveredDevices;

  /// Подключиться к устройству
  Future<void> connectToDevice(Device device);

  /// Отключиться от устройства
  Future<void> disconnect();

  /// Отправить сообщение на устройство
  Future<void> sendMessage(Message message);

  /// Получить поток входящих сообщений
  Stream<Message> get incomingMessages;

  /// Проверить, подключены ли к устройству
  bool get isConnected;

  /// Получить текущее подключенное устройство
  Device? get connectedDevice;

  /// Закрыть все соединения и освободить ресурсы
  void dispose();
}
