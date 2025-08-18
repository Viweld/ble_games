import 'dart:async';
import '../domain/services/nearby_connections_service.dart' as service;
import '../domain/models/device.dart';
import '../domain/models/messages.dart';
import '../domain/models/user.dart';
import 'i_nearby_connections_repository.dart';

/// Реализация репозитория Nearby Connections
class NearbyConnectionsRepository implements INearbyConnectionsRepository {
  final service.NearbyConnectionsService _service;

  NearbyConnectionsRepository(this._service);

  @override
  Future<void> initialize() async {
    await _service.initialize();
  }

  @override
  Future<void> startDiscovery() async {
    await _service.startDiscovery();
  }

  @override
  Future<void> stopDiscovery() async {
    await _service.stopDiscovery();
  }

  @override
  Future<void> startAdvertising() async {
    await _service.startAdvertising();
  }

  @override
  Future<void> stopAdvertising() async {
    await _service.stopAdvertising();
  }

  @override
  Future<void> connectToDevice(Device device) async {
    await _service.connectToDevice(device.id);
  }

  @override
  Future<void> disconnect() async {
    await _service.disconnectAll();
  }

  @override
  Future<void> sendMessage(Message message) async {
    // Отправляем сообщение всем подключенным устройствам
    final connections = _service.connectionsList;
    for (final endpointId in connections.keys) {
      // Создаем простое сообщение для сервиса
      await _service.sendMessage(
        endpointId,
        service.Message(
          type: message.runtimeType.toString(),
          data: {
            'deviceId': message.device.id,
            'deviceName': message.device.name,
            'userId': message.user.id,
            'userName': message.user.name,
          },
        ),
      );
    }
  }

  @override
  Stream<Message> get incomingMessages {
    // Преобразуем service.Message в domain Message
    return _service.messages.map((serviceMessage) {
      // Создаем базовые объекты для Message
      final device = Device(
        id: serviceMessage.data['deviceId'] ?? 'unknown',
        name: serviceMessage.data['deviceName'] ?? 'Unknown Device',
      );

      final user = User(
        id: serviceMessage.data['userId'] ?? 'unknown',
        name: serviceMessage.data['userName'] ?? 'Unknown User',
      );

      // В зависимости от типа создаем соответствующее сообщение
      switch (serviceMessage.type) {
        case 'InvitationMessage':
          return InvitationMessage(device: device, user: user);
        case 'AcceptanceMessage':
          return AcceptanceMessage(device: device, user: user);
        case 'RejectionMessage':
          return RejectionMessage(device: device, user: user);
        case 'TerminationMessage':
          return TerminationMessage(device: device, user: user);
        case 'OpponentLeftMessage':
          return OpponentLeftMessage(device: device, user: user);
        default:
          // По умолчанию возвращаем InvitationMessage
          return InvitationMessage(device: device, user: user);
      }
    });
  }

  @override
  bool get isConnected => _service.hasConnections;

  @override
  Device? get connectedDevice {
    final connections = _service.connectionsList;
    if (connections.isEmpty) return null;

    final firstConnection = connections.entries.first;
    return Device(id: firstConnection.key, name: firstConnection.value);
  }

  @override
  void dispose() {
    _service.dispose();
  }
}
