import 'dart:async';
import 'dart:typed_data';

import 'package:batuga/core/domain/models/device.dart';
import 'package:bluetooth_low_energy/bluetooth_low_energy.dart';
import '../../../constants/app_constants.dart';
import '../../../domain/logger/i_logger.dart';
import '../../../domain/transport/bluetooth/b_bluetooth_connector.dart';
import '../../../domain/transport/bluetooth/i_connector_client.dart';

final class BluetoothConnectorClient extends BBluetoothConnector
    implements IConnectorClient {
  BluetoothConnectorClient({required ILogger logger}) : _log = logger {
    _discoveredDevicesController = StreamController<List<Device>>.broadcast();
  }

  final ILogger _log;
  final _centralManager = CentralManager();
  late final StreamController<List<Device>> _discoveredDevicesController;
  final List<Device> _foundDevices = [];
  final Map<String, Peripheral> _discoveredPeripherals = {};
  Peripheral? _connectedPeripheral;
  GATTCharacteristic? _writeCharacteristic;

  StreamSubscription<DiscoveredEventArgs>? _scanSubscription;
  StreamSubscription<GATTCharacteristicNotifiedEventArgs>? _dataSubscription;

  @override
  Stream<List<Device>> get discoveredDevicesStream =>
      _discoveredDevicesController.stream;

  @override
  Future<void> startDiscovery() async {
    try {
      // Останавливаем предыдущее сканирование если есть
      await stopDiscovery();

      _foundDevices.clear();
      _discoveredPeripherals.clear();
      _log.d('\n🔍 Запуск поиска Bluetooth устройств...');

      // Подписываемся на результаты сканирования
      _scanSubscription = _centralManager.discovered.listen((event) {
        final peripheral = event.peripheral;
        final advertisement = event.advertisement;
        final isOurApp = _isOurApplication(advertisement);
        _processDiscoveredDevice(peripheral, advertisement, isOurApp);
      });

      // Начинаем сканирование, ищем устройства с нашим сервисом
      await _centralManager.startDiscovery(serviceUUIDs: [super.serviceUuid]);

      _log.d('✅ Сканирование запущено, ожидание устройств...');
    } catch (e) {
      _log.e('Ошибка запуска сканирования: $e');
      throw Exception('Ошибка поиска устройств: $e');
    }
  }

  @override
  Future<void> stopDiscovery() async {
    _log.d('🛑 Остановка сканирования...');
    try {
      await _centralManager.stopDiscovery();
      await _scanSubscription?.cancel();
      _scanSubscription = null;
      _log.d('✅ Сканирование остановлено');
    } catch (e) {
      _log.e('⚠️ Ошибка остановки сканирования: $e');
    }
  }

  @override
  Future<void> refreshDiscovery() async {
    try {
      await stopDiscovery();
      await Future.delayed(const Duration(milliseconds: 500));
      await startDiscovery();
    } catch (e) {
      throw Exception('Ошибка обновления поиска устройств: $e');
    }
  }

  @override
  Future<void> connectToDevice(Device device) async {
    _log.d(
      '\n🔗 Попытка подключения к устройству: ${device.name} (${device.id})',
    );

    try {
      // Получаем сохраненный объект Peripheral
      final peripheral = _discoveredPeripherals[device.id];
      if (peripheral == null) {
        throw Exception('Устройство не найдено в списке обнаруженных');
      }

      _connectedPeripheral = peripheral;
      await _centralManager.connect(peripheral);
      _log.d('✅ Подключение установлено');
      final services = await _centralManager.discoverGATT(peripheral);

      bool serviceFound = false;
      for (final service in services) {
        _log.d('Проверяем сервис: ${service.uuid}');
        if (service.uuid == super.serviceUuid) {
          _log.d('✅ Найден наш сервис!');
          serviceFound = true;

          for (final characteristic in service.characteristics) {
            _log.d('Найдена характеристика: ${characteristic.uuid}');

            if (characteristic.uuid == super.characteristicUuid) {
              // Настраиваем уведомления
              if (characteristic.properties.contains(
                GATTCharacteristicProperty.notify,
              )) {
                await _centralManager.setCharacteristicNotifyState(
                  peripheral,
                  characteristic,
                  state: true,
                );

                _dataSubscription = _centralManager.characteristicNotified
                    .where(
                      (args) =>
                          args.characteristic.uuid == super.characteristicUuid,
                    )
                    .listen((event) {
                      super.translateIncomingData(event.value);
                    });
              }

              // Сохраняем характеристику для записи
              // Проверяем, поддерживает ли характеристика запись с подтверждением или без
              if (characteristic.properties.contains(
                    GATTCharacteristicProperty.write,
                  ) ||
                  characteristic.properties.contains(
                    GATTCharacteristicProperty.writeWithoutResponse,
                  )) {
                _writeCharacteristic = characteristic;
              }
            }
          }
          break;
        }
      }

      if (!serviceFound) {
        throw Exception(
          'На устройстве не найден наш сервис ${super.serviceUuid}',
        );
      }

      await _centralManager
          .requestMTU(peripheral, mtu: 512)
          .catchError((_) => 0);

      // Небольшая задержка для стабилизации соединения
      await Future.delayed(const Duration(milliseconds: 300));
    } catch (e) {
      _log.e('❌ Ошибка подключения: $e');

      // Очищаем состояние при ошибке
      _connectedPeripheral = null;

      _writeCharacteristic = null;

      // Определяем тип ошибки и даём понятное объяснение
      if (e.toString().contains('timeout')) {
        throw Exception(
          'Превышено время ожидания подключения. Проверьте расстояние между устройствами.',
        );
      } else if (e.toString().contains('not found')) {
        throw Exception(
          'Устройство не найдено. Убедитесь, что другое устройство в режиме ожидания.',
        );
      } else {
        throw Exception(
          'Устройство недоступно для подключения. Убедитесь, что другое устройство в режиме ожидания. Детали: $e',
        );
      }
    }
  }

  @override
  Future<void> sendRawMessage(Uint8List data) async {
    _log.d('📤 Попытка отправки сообщения...');
    if (_connectedPeripheral == null || _writeCharacteristic == null) {
      throw Exception('Нет активного соединения или характеристики для записи');
    }

    try {
      await _centralManager.writeCharacteristic(
        _connectedPeripheral!,
        _writeCharacteristic!,
        value: data,
        type: GATTCharacteristicWriteType.withoutResponse,
      );
    } on Exception catch (e) {
      _log.e('❌ Ошибка отправки данных: $e');
      if (!_isGattError133(e)) {
        throw Exception('Ошибка отправки данных: $e');
      } else {
        await _resetConnection();
        throw Exception(
          'Ошибка соединения Bluetooth (статус 133). Соединение было сброшено. Пожалуйста, подключитесь заново к устройству.',
        );
      }
    }
  }

  @override
  Future<void> disconnect() async {
    _log.d('🔌 Отключение от устройства...');
    try {
      await _dataSubscription?.cancel();
      _dataSubscription = null;
      if (_connectedPeripheral == null) return;
      await _centralManager.disconnect(_connectedPeripheral!);
      _connectedPeripheral = null;
    } catch (e) {
      _log.e('⚠️ Ошибка отключения: $e');
    }
  }

  @override
  Future<void> onDispose() async {
    _log.d('🧹 Начата очистка ресурсов BluetoothConnectorClient...');
    await _discoveredDevicesController.close();
    await _scanSubscription?.cancel();
    await _dataSubscription?.cancel();
    await stopDiscovery();
    await disconnect();
    _log.d('🧹 Завершена очистка ресурсов BluetoothConnectorClient...');
  }

  // ВСПОМОГАТЕЛЬНЫЕ МЕТОДЫ
  // ---------------------------------------------------------------------------
  /// Проверяет, является ли устройство нашим приложением
  bool _isOurApplication(Advertisement advertisement) {
    // Проверяем по имени устройства
    if (advertisement.name?.contains(super.appName) == true) return true;

    // Проверяем по сервису
    if (advertisement.serviceUUIDs.contains(super.serviceUuid)) return true;

    // Проверяем по manufacturer data
    final manufacturerDataList = advertisement.manufacturerSpecificData;
    if (manufacturerDataList.isNotEmpty) {
      // Ищем наш маркер в любом из manufacturer data
      for (final data in manufacturerDataList) {
        if (data.id == 0x0499 &&
            data.data.length >= 3 &&
            data.data[0] == 0x01 &&
            data.data[1] == 0x02 &&
            data.data[2] == 0x03) {
          return true;
        }
      }
    }
    return false;
  }

  /// Обрабатывает найденное устройство
  void _processDiscoveredDevice(
    Peripheral peripheral,
    Advertisement advertisement,
    bool isOurApp,
  ) {
    final deviceName = advertisement.name ?? peripheral.uuid.toString();
    final deviceId = peripheral.uuid.toString();
    _discoveredPeripherals[deviceId] = peripheral;
    final cleanName = _getCleanDeviceName(deviceName, super.appName);
    final discovered = Device(
      id: deviceId,
      name: cleanName.replaceFirst(AppConstants.bluetoothDevicePrefix, ''),
      isOurApp: isOurApp,
    );
    if (!_foundDevices.every((p) => p.id != discovered.id)) return;
    isOurApp
        ? _foundDevices.insert(0, discovered)
        : _foundDevices.add(discovered);
    _discoveredDevicesController.add(List.unmodifiable(_foundDevices));
  }

  /// Очищает имя устройства от названия приложения и лишних символов
  String _getCleanDeviceName(String deviceName, String appName) {
    if (!deviceName.contains(appName)) return deviceName;
    var cleanName = deviceName
        .replaceAll(appName, '')
        .replaceAll('🎮', '')
        .trim();
    return (cleanName.startsWith('-'))
        ? cleanName.substring(1).trim()
        : cleanName;
  }

  /// Проверяет, является ли ошибка ошибкой статуса 133
  bool _isGattError133(Exception e) {
    return e.toString().contains('status: 133') ||
        e.toString().contains('GATT_ERROR') ||
        e.toString().contains('IllegalStateException');
  }

  /// Метод для сброса соединения и попытки переподключения
  Future<void> _resetConnection() async {
    _log.d('🔄 Сброс соединения...');
    try {
      await disconnect();
      _connectedPeripheral = null;
      _writeCharacteristic = null;
      await Future.delayed(const Duration(milliseconds: 500));
    } catch (e) {
      _log.e('❌ Ошибка сброса соединения: $e');
    }
  }
}
