import '../../../core/domain/models/player.dart';

/// Интерфейс репозитория Bluetooth
abstract class ICommunicateRepository {
  /// Инициализировать Bluetooth
  Future<void> initialize();

  /// Начать поиск устройств
  Future<void> startDiscovery();

  /// Остановить поиск устройств
  Future<void> stopDiscovery();

  /// Включить рекламу присутствия приложения (BLE Advertise)
  Future<void> startAdvertising();

  /// Отключить рекламу присутствия приложения (BLE Advertise)
  Future<void> stopAdvertising();

  /// Получить список найденных устройств
  Stream<List<Player>> get discoveredDevices;

  /// Подключиться к устройству
  Future<void> connectToDevice(Player player);

  /// Отключиться от устройства
  Future<void> disconnect();

  /// Отправить данные
  Future<void> sendData(Map<String, dynamic> data);

  /// Получить поток входящих данных
  Stream<Map<String, dynamic>> get incomingData;

  /// Проверить, подключены ли к устройству
  bool get isConnected;

  /// Получить текущее подключенное устройство
  Player? get connectedDevice;

  /// Построить сообщение-приглашение (транспортный уровень) из доменных сущностей
  Map<String, dynamic> buildInvitationMessage({
    required Player from,
    required Player to,
  });

  /// Преобразовать транспортное представление игрока в доменную модель
  Player parsePlayer(Map<String, dynamic> json);

  void dispose();
}
