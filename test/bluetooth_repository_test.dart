import 'package:flutter_test/flutter_test.dart';
import 'package:batuga/core/services/bluetooth_service.dart';
import 'package:batuga/core/domain/services/i_bluetooth_service.dart';

void main() {
  group('Bluetooth Repository Test', () {
    late IBluetoothService bluetoothRepository;

    setUp(() {
      bluetoothRepository = BluetoothService();
    });

    tearDown(() {
      bluetoothRepository.dispose();
    });

    test('Создание Bluetooth репозитория', () {
      expect(bluetoothRepository, isNotNull);
      expect(bluetoothRepository, isA<BluetoothService>());
    });

    test('Проверка начального состояния', () {
      expect(bluetoothRepository.isConnected, false);
      expect(bluetoothRepository.connectedDevice, isNull);
    });

    test('Проверка существования потоков', () {
      expect(bluetoothRepository.discoveredDevices, isNotNull);
      expect(bluetoothRepository.incomingMessages, isNotNull);
    });

    test('Проверка существования методов', () {
      expect(bluetoothRepository.initialize, isNotNull);
      expect(bluetoothRepository.startDiscovery, isNotNull);
      expect(bluetoothRepository.stopDiscovery, isNotNull);
      expect(bluetoothRepository.startAdvertising, isNotNull);
      expect(bluetoothRepository.stopAdvertising, isNotNull);
      expect(bluetoothRepository.connectToDevice, isNotNull);
      expect(bluetoothRepository.disconnect, isNotNull);
      expect(bluetoothRepository.sendMessage, isNotNull);
      expect(bluetoothRepository.dispose, isNotNull);
    });
  });
}
