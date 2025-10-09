import 'connection_states.dart';
import 'i_messenger.dart';

abstract interface class IConnectionManager {
  /// Текущее состояние подключения
  BluetoothConnectionState? get currentConnectionState;

  /// Поток состояний подключения
  Stream<BluetoothConnectionState> get connectionStateStream;

  /// Мессенджер для обмена сообщениями
  IMessenger get messenger;

  /// Освободить ресурсы
  Future<void> dispose();
}
