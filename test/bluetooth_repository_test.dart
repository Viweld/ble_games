import 'package:batuga/core/data/repositories/bluetooth_manager.dart';
import 'package:batuga/core/domain/services/bluetooth_manager/i_bluetooth_manager.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Bluetooth Repository Test', () {
    late IBluetoothManager bluetoothManager;

    setUp(() {
      bluetoothManager = BluetoothManager();
    });

    tearDown(() {
      bluetoothManager.dispose();
    });

    test('Создание Bluetooth репозитория', () {
      expect(bluetoothManager, isNotNull);
      expect(bluetoothManager, isA<BluetoothManager>());
    });

    test('Проверка начального состояния', () {
      expect(bluetoothManager.isConnected, false);
      expect(bluetoothManager.connectedDevice, isNull);
    });

    test('Проверка существования потоков', () {
      expect(bluetoothManager.discoveredDevices, isNotNull);
      expect(bluetoothManager.incomingMessages, isNotNull);
    });

    test('Проверка существования методов', () {
      expect(bluetoothManager.initialize, isNotNull);
      expect(bluetoothManager.startDiscovery, isNotNull);
      expect(bluetoothManager.stopDiscovery, isNotNull);
      expect(bluetoothManager.startAdvertising, isNotNull);
      expect(bluetoothManager.stopAdvertising, isNotNull);
      expect(bluetoothManager.connectToDevice, isNotNull);
      expect(bluetoothManager.disconnect, isNotNull);
      expect(bluetoothManager.sendMessage, isNotNull);
      expect(bluetoothManager.dispose, isNotNull);
    });
  });
}
