import 'dart:async';

import 'package:bluetooth_low_energy/bluetooth_low_energy.dart';

import '../domain/models/device.dart';
import '../domain/services/i_bluetooth_discovery_service.dart';

class BluetoothDiscoveryService implements IBluetoothDiscoveryService {
  BluetoothDiscoveryService(this._centralManager);

  final CentralManager _centralManager;
  final StreamController<List<Device>> _discoveredDevicesController =
      StreamController<List<Device>>.broadcast();

  final List<Device> _foundDevices = [];
  final Map<String, Peripheral> _discoveredPeripherals = {};
  StreamSubscription<DiscoveredEventArgs>? _scanSubscription;
  Timer? _scanTimer;

  @override
  Stream<List<Device>> get discoveredDevices =>
      _discoveredDevicesController.stream;

  @override
  Future<void> startDiscovery() async {
    await stopDiscovery();

    _foundDevices.clear();
    _discoveredPeripherals.clear();

    _scanSubscription = _centralManager.discovered.listen((event) {
      final peripheral = event.peripheral;
      final advertisement = event.advertisement;
      final isOurApp = _isOurApplication(advertisement);
      _processDiscoveredDevice(peripheral, advertisement, isOurApp);
    });

    await _centralManager.startDiscovery(serviceUUIDs: []);

    _scanTimer?.cancel();
    _scanTimer = Timer(const Duration(seconds: 30), () async {
      await stopDiscovery();
    });
  }

  @override
  Future<void> stopDiscovery() async {
    await _centralManager.stopDiscovery();
    await _scanSubscription?.cancel();
    _scanSubscription = null;
    _scanTimer?.cancel();
    _scanTimer = null;
  }

  @override
  Future<void> refreshDiscovery() async {
    await stopDiscovery();
    await Future.delayed(const Duration(milliseconds: 500));
    await startDiscovery();
  }

  void _processDiscoveredDevice(
    Peripheral peripheral,
    Advertisement advertisement,
    bool isOurApp,
  ) {
    final deviceName = advertisement.name ?? peripheral.uuid.toString();
    final deviceId = peripheral.uuid.toString();
    _discoveredPeripherals[deviceId] = peripheral;

    final cleanName = _getCleanDeviceName(deviceName, '🎮BaTuGa');

    final discovered = Device(
      id: deviceId,
      name: cleanName,
      isOurApp: isOurApp,
    );

    if (!_foundDevices.every((p) => p.id != discovered.id)) return;
    isOurApp
        ? _foundDevices.insert(0, discovered)
        : _foundDevices.add(discovered);
    _discoveredDevicesController.add(List.unmodifiable(_foundDevices));
  }

  bool _isOurApplication(Advertisement advertisement) {
    // логику взял из исходного сервиса
    if (advertisement.name?.contains('🎮BaTuGa') == true) return true;
    return false;
  }

  String _getCleanDeviceName(String deviceName, String appName) {
    if (!deviceName.contains(appName)) return deviceName;
    var cleanName = deviceName
        .replaceAll(appName, '')
        .replaceAll('🎮', '')
        .trim();
    return cleanName.startsWith('-')
        ? cleanName.substring(1).trim()
        : cleanName;
  }
}
