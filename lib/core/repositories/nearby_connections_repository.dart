import 'dart:async';
import '../domain/models/device.dart';
import '../domain/models/messages.dart';
import '../domain/services/i_nearby_connections_service.dart';
import 'i_nearby_connections_repository.dart';

/// Реализация репозитория Nearby Connections
class NearbyConnectionsRepository implements INearbyConnectionsRepository {
  NearbyConnectionsRepository(this._service);

  final INearbyConnectionsService _service;

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
      await _service.sendMessage(endpointId, message);
    }
  }

  @override
  Stream<Message> get incomingMessages => _service.messages;

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
