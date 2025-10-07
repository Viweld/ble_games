import '../../models/device.dart';
import '../../models/messages.dart';
import '../../models/user.dart';

// -----------------------------------------------------------------------------
/// Состояния подключения Bluetooth
sealed class BluetoothConnectState {}

/// Состояние отключено
final class BluetoothDisconnectedState implements BluetoothConnectState {
  const BluetoothDisconnectedState();
}

/// Ожидание подтверждения подключения
final class BluetoothWaitingConfirmationState implements BluetoothConnectState {
  const BluetoothWaitingConfirmationState();
}

/// Получено приглашение на подключение
final class BluetoothReceivedInvitationState implements BluetoothConnectState {
  const BluetoothReceivedInvitationState({
    required this.user,
    required this.device,
  });

  final User user;
  final Device device;
}

/// Состояние подключено
final class BluetoothConnectedState implements BluetoothConnectState {
  const BluetoothConnectedState(this.role);

  final BluetoothConnectionRole role;
}

// -----------------------------------------------------------------------------
/// Роли в Bluetooth подключении
enum BluetoothConnectionRole { central, peripheral }

// -----------------------------------------------------------------------------
/// Интерфейс сервиса подключения к другим устройствам (central mode)
abstract interface class IBluetoothConnection {
  /// Текущее состояние подключения
  BluetoothConnectState get currentConnectionState;

  /// Поток состояний подключения
  Stream<BluetoothConnectState> get connectionStateStream;

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
