import 'dart:async';

import 'package:bluetooth_low_energy/bluetooth_low_energy.dart';

import '../domain/services/i_bluetooth_advertising_service.dart';

class BluetoothAdvertisingService implements IBluetoothAdvertisingService {
  BluetoothAdvertisingService(this._peripheralManager);

  final PeripheralManager _peripheralManager;

  final StreamController<String> _clientConnectionController =
      StreamController<String>.broadcast();
  final Set<String> _connectedClients = {};
  StreamSubscription<GATTCharacteristicWriteRequestedEventArgs>?
  _writeRequestSubscription;

  bool _isAdvertising = false;
  final _serviceUuid = UUID.fromString('0000a7c0-0000-1000-8000-00805f9b34fb');
  final _characteristicUuid = UUID.fromString(
    '0000a7c1-0000-1000-8000-00805f9b34fb',
  );

  @override
  Stream<String> get clientConnections => _clientConnectionController.stream;

  @override
  Future<void> startAdvertising() async {
    await stopAdvertising();

    final service = GATTService(
      uuid: _serviceUuid,
      isPrimary: true,
      includedServices: [],
      characteristics: [
        GATTCharacteristic.mutable(
          uuid: _characteristicUuid,
          properties: [
            GATTCharacteristicProperty.read,
            GATTCharacteristicProperty.write,
            GATTCharacteristicProperty.notify,
          ],
          permissions: [
            GATTCharacteristicPermission.read,
            GATTCharacteristicPermission.write,
          ],
          descriptors: [],
        ),
      ],
    );

    await _peripheralManager.addService(service);

    _writeRequestSubscription = _peripheralManager.characteristicWriteRequested
        .listen((event) {
          final clientId = event.central.uuid.toString();
          if (!_connectedClients.contains(clientId)) {
            _connectedClients.add(clientId);
            _clientConnectionController.add(clientId);
          }
          _peripheralManager.respondWriteRequest(event.request);
        });

    await _peripheralManager.startAdvertising(
      Advertisement(name: '🎮BaTuGa', serviceUUIDs: [_serviceUuid]),
    );

    _isAdvertising = true;
  }

  @override
  Future<void> stopAdvertising() async {
    if (!_isAdvertising) return;
    await _peripheralManager.stopAdvertising();
    await _writeRequestSubscription?.cancel();
    _writeRequestSubscription = null;
    _connectedClients.clear();
    _isAdvertising = false;
  }
}
