import '../models/device.dart';
import '../models/messages.dart';

/// Интерфейс сервиса подключения к другим устройствам (central mode)
abstract interface class IBluetoothConnectionService {
  /// Проверить, подключены ли к устройству
  bool get isConnected;

  /// Получить текущее подключенное устройство
  Device? get connectedDevice;

  /// Поток входящих сообщений
  Stream<Message> get incomingMessages;

  /// Подключиться к устройству
  Future<void> connectToDevice(Device device);

  /// Отключиться от устройства
  Future<void> disconnect();

  /// Отправить сообщение на устройство
  Future<void> sendMessage(Message message);
}
