import '../../models/device.dart';
import '../../models/messages.dart';
import '../../transport/bluetooth/b_bluetooth_connection_manager.dart';

// -----------------------------------------------------------------------------
/// Роли в Bluetooth подключении
enum BluetoothConnectionRole { central, peripheral }

// -----------------------------------------------------------------------------
/// Интерфейс сервиса подключения к другим устройствам (central mode)
abstract interface class IBluetoothConnection {
  /// Текущее состояние подключения
  BluetoothConnectionState get currentConnectionState;

  /// Поток состояний подключения
  Stream<BluetoothConnectionState> get connectionStateStream;

  /// Получить текущее подключенное устройство
  Device? get connectedDevice;

  /// Поток входящих сообщений
  Stream<Message> get messagesStream;

  /// Подключиться к устройству
  Future<void> connectToDevice(Device device);

  /// Отключиться от устройства
  Future<void> disconnect();

  /// Отправить сообщение на устройство
  Future<void> sendMessage(Message message);
}
