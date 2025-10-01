import 'package:flutter_test/flutter_test.dart';
import 'package:batuga/core/services/bluetooth_service.dart';
import 'package:batuga/core/domain/services/i_bluetooth_service.dart';

void main() {
  group('Bluetooth Connection Integration Test', () {
    late IBluetoothService bluetoothRepository;

    setUp(() {
      bluetoothRepository = BluetoothService();
    });

    tearDown(() {
      bluetoothRepository.dispose();
    });

    test('Создание и инициализация Bluetooth-репозитория', () async {
      // Проверяем, что репозиторий создан
      expect(bluetoothRepository, isNotNull);

      // Проверяем начальное состояние
      expect(bluetoothRepository.isConnected, false);

      // Проверяем, что потоки созданы
      expect(bluetoothRepository.discoveredDevices, isNotNull);
      expect(bluetoothRepository.incomingMessages, isNotNull);
    });

    test('Проверка методов репозитория', () {
      // Проверяем, что все необходимые методы существуют
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

    test('Проверка геттеров', () {
      // Проверяем, что геттеры существуют и возвращают правильные типы
      expect(bluetoothRepository.isConnected, isA<bool>());
      expect(bluetoothRepository.connectedDevice, isNull);
      expect(bluetoothRepository.discoveredDevices, isNotNull);
      expect(bluetoothRepository.incomingMessages, isNotNull);
    });
  });
}
