import 'package:flutter_test/flutter_test.dart';
import 'package:bluetooth_low_energy/bluetooth_low_energy.dart';

void main() {
  group('Bluetooth Improvements Test', () {
    test('Write type constants are available', () async {
      // Проверяем, что константы типов записи доступны
      expect(GATTCharacteristicWriteType.withResponse, isNotNull);
      expect(GATTCharacteristicWriteType.withoutResponse, isNotNull);
    });

    test('Property constants are available', () async {
      // Проверяем, что константы свойств доступны
      expect(GATTCharacteristicProperty.write, isNotNull);
      expect(GATTCharacteristicProperty.writeWithoutResponse, isNotNull);
      expect(GATTCharacteristicProperty.notify, isNotNull);
    });

    test('Write type constants are available', () async {
      // Проверяем, что константы типов записи доступны
      expect(GATTCharacteristicWriteType.withResponse, isNotNull);
      expect(GATTCharacteristicWriteType.withoutResponse, isNotNull);
    });

    test('Property constants are available', () async {
      // Проверяем, что константы свойств доступны
      expect(GATTCharacteristicProperty.write, isNotNull);
      expect(GATTCharacteristicProperty.writeWithoutResponse, isNotNull);
      expect(GATTCharacteristicProperty.notify, isNotNull);
    });
  });
}
