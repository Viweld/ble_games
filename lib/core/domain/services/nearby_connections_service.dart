import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:nearby_connections/nearby_connections.dart';
import '../../data/dto/messages_dto.dart';
import 'i_nearby_connections_service.dart';
import '../models/messages.dart';

class NearbyConnectionsService implements INearbyConnectionsService {
  static const String _serviceId = 'com.example.bluetooth_toe';
  static const Strategy _strategy = Strategy.P2P_CLUSTER;

  final _connectionsController =
      StreamController<Map<String, String>>.broadcast();
  final _messagesController = StreamController<Message>.broadcast();

  final Map<String, String> _connections = {};
  bool _isInitialized = false;

  @override
  Stream<Map<String, String>> get connections => _connectionsController.stream;

  @override
  Stream<Message> get messages => _messagesController.stream;

  @override
  Map<String, String> get connectionsList => Map.unmodifiable(_connections);

  @override
  bool get hasConnections => _connections.isNotEmpty;

  @override
  Future<void> initialize() async {
    if (_isInitialized) return;
    _isInitialized = true;
  }

  @override
  Future<void> startDiscovery() async {
    _ensureInited();
    await Nearby().startDiscovery(
      _serviceId,
      _strategy,
      onEndpointFound: (id, name, serviceId) {
        _connections[id] = name;
        _connectionsController.add(connectionsList);
      },
      onEndpointLost: (id) {
        _connections.remove(id);
        _connectionsController.add(connectionsList);
      },
    );
  }

  @override
  Future<void> stopDiscovery() async {
    await Nearby().stopDiscovery();
  }

  @override
  Future<void> startAdvertising() async {
    _ensureInited();
    await Nearby().startAdvertising(
      'Player',
      _strategy,
      onConnectionInitiated: _onConnectionInit,
      onConnectionResult: (id, status) {
        if (status == Status.CONNECTED) {
          _connectionsController.add(connectionsList);
        }
      },
      onDisconnected: (id) {
        _connections.remove(id);
        _connectionsController.add(connectionsList);
      },
    );
  }

  @override
  Future<void> stopAdvertising() async {
    await Nearby().stopAdvertising();
  }

  void _onConnectionInit(String id, ConnectionInfo info) {
    // автоматически принимаем
    Nearby().acceptConnection(
      id,
      onPayLoadRecieved: (endid, payload) {
        if (payload.type == PayloadType.BYTES) {
          final jsonStr = String.fromCharCodes(payload.bytes!);
          final msg = MessageDto.fromJson(jsonDecode(jsonStr)).toDomain();
          _messagesController.add(msg);
        }
      },
      onPayloadTransferUpdate: (_, __) {},
    );
  }

  @override
  Future<void> connectToDevice(String endpointId) async {
    await Nearby().requestConnection(
      'Player',
      endpointId,
      onConnectionInitiated: _onConnectionInit,
      onConnectionResult: (id, status) {
        if (status == Status.CONNECTED) {
          _connectionsController.add(connectionsList);
        }
      },
      onDisconnected: (id) {
        _connections.remove(id);
        _connectionsController.add(connectionsList);
      },
    );
  }

  @override
  Future<void> sendMessage(String endpointId, Message message) async {
    final json = jsonEncode(MessageDto.fromDomain(message).toJson());
    final bytes = Uint8List.fromList(json.codeUnits);
    await Nearby().sendBytesPayload(endpointId, bytes);
  }

  @override
  Future<void> disconnect(String endpointId) async {
    await Nearby().disconnectFromEndpoint(endpointId);
    _connections.remove(endpointId);
    _connectionsController.add(connectionsList);
  }

  @override
  Future<void> disconnectAll() async {
    for (final id in _connections.keys.toList()) {
      await disconnect(id);
    }
  }

  @override
  void dispose() {
    _connectionsController.close();
    _messagesController.close();
    disconnectAll();
  }

  void _ensureInited() {
    if (!_isInitialized) throw Exception('Сервис не инициализирован');
  }
}
