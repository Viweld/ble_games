import 'package:batuga/core/data/repositories/bluetooth_manager.dart';
import 'package:batuga/core/domain/services/bluetooth_manager/i_bluetooth_manager.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Bluetooth Connection Integration Test', () {
    late IBluetoothManager bluetoothManager;

    setUp(() {
      bluetoothManager = BluetoothManager();
    });

    tearDown(() {
      bluetoothManager.dispose();
    });

    test('Создание и инициализация Bluetooth-репозитория', () async {
      // Проверяем, что репозиторий создан
      expect(bluetoothManager, isNotNull);

      // Проверяем начальное состояние
      expect(bluetoothManager.isConnected, false);

      // Проверяем, что потоки созданы
      expect(bluetoothManager.discoveredDevices, isNotNull);
      expect(bluetoothManager.incomingMessages, isNotNull);
    });

    test('Проверка методов репозитория', () {
      // Проверяем, что все необходимые методы существуют
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

    test('Проверка геттеров', () {
      // Проверяем, что геттеры существуют и возвращают правильные типы
      expect(bluetoothManager.isConnected, isA<bool>());
      expect(bluetoothManager.connectedDevice, isNull);
      expect(bluetoothManager.discoveredDevices, isNotNull);
      expect(bluetoothManager.incomingMessages, isNotNull);
    });
  });
}
