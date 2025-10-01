import '../models/device.dart';
import '../models/messages.dart';

/// Интерфейс репозитория Bluetooth
abstract class IBluetoothService {
  /// Проверить, подключены ли к устройству
  bool get isConnected;

  /// Получить текущее подключенное устройство
  Device? get connectedDevice;

  // СТРИМЫ:
  // ---------------------------------------------------------------------------
  /// Получить поток входящих сообщений
  Stream<Message> get incomingMessages;

  /// Получить поток подключений клиентов
  Stream<String> get clientConnections;

  /// Получить список найденных устройств
  Stream<List<Device>> get discoveredDevices;

  // МЕТОДЫ:
  // ---------------------------------------------------------------------------
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

  /// Подключиться к устройству
  Future<void> connectToDevice(Device device);

  /// Отключиться от устройства
  Future<void> disconnect();

  /// Отправить сообщение на устройство
  Future<void> sendMessage(Message message);

  /// Закрыть все соединения и освободить ресурсы
  void dispose();
}
