import 'package:flutter_test/flutter_test.dart';
import 'package:batuga/core/repositories/bluetooth_repository.dart';
import 'package:batuga/core/repositories/i_bluetooth_repository.dart';

void main() {
  group('Bluetooth Repository Test', () {
    late IBluetoothRepository bluetoothRepository;

    setUp(() {
      bluetoothRepository = BluetoothRepository();
    });

    tearDown(() {
      bluetoothRepository.dispose();
    });

    test('Создание Bluetooth репозитория', () {
      expect(bluetoothRepository, isNotNull);
      expect(bluetoothRepository, isA<BluetoothRepository>());
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
