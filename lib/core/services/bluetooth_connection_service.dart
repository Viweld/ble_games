import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:bluetooth_low_energy/bluetooth_low_energy.dart';

import '../data/dto/messages_dto.dart';
import '../domain/models/device.dart';
import '../domain/models/messages.dart';
import '../domain/services/i_bluetooth_connection_service.dart';

class BluetoothConnectionService implements IBluetoothConnectionService {
  BluetoothConnectionService(this._centralManager);

  final CentralManager _centralManager;
  Peripheral? _connectedPeripheral;
  GATTCharacteristic? _writeCharacteristic;
  StreamSubscription<GATTCharacteristicNotifiedEventArgs>? _dataSubscription;

  final StreamController<Message> _incomingMessagesController =
      StreamController<Message>.broadcast();

  final _serviceUuid = UUID.fromString('0000a7c0-0000-1000-8000-00805f9b34fb');
  final _characteristicUuid = UUID.fromString(
    '0000a7c1-0000-1000-8000-00805f9b34fb',
  );

  @override
  bool get isConnected => _connectedPeripheral != null;

  @override
  Device? get connectedDevice => _connectedPeripheral != null
      ? Device(
          id: _connectedPeripheral!.uuid.toString(),
          name: _connectedPeripheral!.uuid.toString(),
          isOurApp: false,
        )
      : null;

  @override
  Stream<Message> get incomingMessages => _incomingMessagesController.stream;

  @override
  Future<void> connectToDevice(Device device) async {
    final peripheral = Peripheral(uuid: UUID.fromString(device.id));
    _connectedPeripheral = peripheral;
    await _centralManager.connect(peripheral);
    final services = await _centralManager.discoverGATT(peripheral);

    for (final service in services) {
      if (service.uuid == _serviceUuid) {
        for (final characteristic in service.characteristics) {
          if (characteristic.uuid == _characteristicUuid) {
            await _centralManager.setCharacteristicNotifyState(
              peripheral,
              characteristic,
              state: true,
            );

            _dataSubscription = _centralManager.characteristicNotified
                .where(
                  (args) => args.characteristic.uuid == _characteristicUuid,
                )
                .listen((event) {
                  try {
                    final message = utf8.decode(event.value);
                    final jsonData =
                        jsonDecode(message) as Map<String, dynamic>;
                    _incomingMessagesController.add(
                      MessageDto.fromJson(jsonData).toDomain(),
                    );
                  } catch (_) {}
                });

            _writeCharacteristic = characteristic;
          }
        }
      }
    }
  }

  @override
  Future<void> disconnect() async {
    await _dataSubscription?.cancel();
    _dataSubscription = null;
    if (_connectedPeripheral != null) {
      await _centralManager.disconnect(_connectedPeripheral!);
    }
    _connectedPeripheral = null;
    _writeCharacteristic = null;
  }

  @override
  Future<void> sendMessage(Message message) async {
    if (_connectedPeripheral == null || _writeCharacteristic == null) {
      throw Exception('Нет активного соединения или характеристики для записи');
    }

    final jsonMessage = jsonEncode(MessageDto.fromDomain(message).toJson());
    final bytesMessage = Uint8List.fromList(utf8.encode(jsonMessage));

    await _centralManager.writeCharacteristic(
      _connectedPeripheral!,
      _writeCharacteristic!,
      value: bytesMessage,
      type: GATTCharacteristicWriteType.withoutResponse,
    );
  }
}
