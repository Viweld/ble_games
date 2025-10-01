import '../domain/models/device.dart';
import '../domain/models/messages.dart';
import '../domain/repositories/i_bluetooth_repository.dart';
import '../domain/services/i_bluetooth_advertising_service.dart';
import '../domain/services/i_bluetooth_connection_service.dart';
import '../domain/services/i_bluetooth_discovery_service.dart';
import '../domain/services/i_bluetooth_permissions_service.dart';
import '../domain/services/i_bluetooth_state_service.dart';

class BluetoothFacade {
  BluetoothFacade({
    required IBluetoothStateService stateService,
    required IBluetoothPermissionsService permissionsService,
    required IBluetoothDiscoveryService discoveryService,
    required IBluetoothAdvertisingService advertisingService,
    required IBluetoothConnectionService connectionService,
  }) : _stateService = stateService,
       _permissionsService = permissionsService,
       _discoveryService = discoveryService,
       _advertisingService = advertisingService,
       _connectionService = connectionService;

  final IBluetoothStateService _stateService;
  final IBluetoothPermissionsService _permissionsService;
  final IBluetoothDiscoveryService _discoveryService;
  final IBluetoothAdvertisingService _advertisingService;
  final IBluetoothConnectionService _connectionService;

  // === Permissions ===
  // ---------------------------------------------------------------------------
  Future<bool> checkPermissions() => _permissionsService.checkPermissions();
  Future<bool> openAppSettings() => _permissionsService.openAppSettings();

  // === State ===
  // ---------------------------------------------------------------------------
  Future<void> initialize() => _stateService.initialize();
  Future<bool> isBluetoothEnabled() => _stateService.isBluetoothEnabled();
  Future<bool> enableBluetooth() => _stateService.enableBluetooth();

  // === Discovery ===
  // ---------------------------------------------------------------------------
  Stream<List<Device>> get discoveredDevices =>
      _discoveryService.discoveredDevices;
  Future<void> startDiscovery() => _discoveryService.startDiscovery();
  Future<void> stopDiscovery() => _discoveryService.stopDiscovery();
  Future<void> refreshDiscovery() => _discoveryService.refreshDiscovery();

  // === Advertising ===
  // ---------------------------------------------------------------------------
  Future<void> startAdvertising() => _advertisingService.startAdvertising();
  Future<void> stopAdvertising() => _advertisingService.stopAdvertising();
  Stream<String> get clientConnections => _advertisingService.clientConnections;

  // === Connection ===
  // ---------------------------------------------------------------------------
  bool get isConnected => _connectionService.isConnected;
  Device? get connectedDevice => _connectionService.connectedDevice;
  Stream<Message> get incomingMessages => _connectionService.incomingMessages;
  Future<void> connectToDevice(Device device) =>
      _connectionService.connectToDevice(device);
  Future<void> disconnect() => _connectionService.disconnect();
  Future<void> sendMessage(Message message) =>
      _connectionService.sendMessage(message);
}
