import 'package:batuga/core/domain/models/messages.dart';
import 'package:batuga/core/domain/services/bluetooth/i_messenger.dart';

final class BluetoothMessenger implements IMessenger {
  @override
  // TODO: implement messages
  Stream<Message> get messages => throw UnimplementedError();

  @override
  Future<void> sendMessage(Message message) {
    // TODO: implement sendMessage
    throw UnimplementedError();
  }
}
