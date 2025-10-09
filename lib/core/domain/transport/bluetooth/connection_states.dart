part of 'b_bluetooth_connection_manager.dart';

// -----------------------------------------------------------------------------
/// Состояния подключения Bluetooth
sealed class BluetoothConnectionState {}

/// Состояние отключено
final class BluetoothDisconnectedState implements BluetoothConnectionState {
  const BluetoothDisconnectedState();
}

/// Ожидание подтверждения подключения
final class BluetoothWaitingConfirmationState
    implements BluetoothConnectionState {
  const BluetoothWaitingConfirmationState();
}

/// Получено приглашение на подключение
final class BluetoothReceivedInvitationState
    implements BluetoothConnectionState {
  const BluetoothReceivedInvitationState({
    required this.user,
    required this.device,
  });

  final User user;
  final Device device;
}

/// Состояние подключено
final class BluetoothConnectedState implements BluetoothConnectionState {
  const BluetoothConnectedState({required this.user, required this.device});

  final User user;
  final Device device;
}
