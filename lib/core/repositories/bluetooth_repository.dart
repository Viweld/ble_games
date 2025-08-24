import 'dart:async';
import 'dart:convert';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import '../constants/app_constants.dart';
import '../data/dto/messages_dto.dart';
import '../domain/models/device.dart';
import '../domain/models/messages.dart';
import 'i_bluetooth_repository.dart';

/// Реализация репозитория Bluetooth на основе flutter_blue_plus
class BluetoothRepository implements IBluetoothRepository {
  BluetoothRepository() {
    _discoveredDevicesController = StreamController<List<Device>>.broadcast();
    _incomingMessagesController = StreamController<Message>.broadcast();
  }

  late final StreamController<List<Device>> _discoveredDevicesController;
  late final StreamController<Message> _incomingMessagesController;

  final List<Device> _foundDevices = [];

  BluetoothDevice? _connectedDevice;
  BluetoothCharacteristic? _writeCharacteristic;
  StreamSubscription<List<ScanResult>>? _scanSubscription;
  StreamSubscription<List<int>>? _dataSubscription;
  bool _isInitialized = false;
  Timer? _scanTimer;

  final String _serviceUuid = '0000a7c0-0000-1000-8000-00805f9b34fb';

  @override
  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      // Проверяем поддержку Bluetooth
      final isSupported = await FlutterBluePlus.isSupported;
      if (!isSupported) {
        throw Exception('Bluetooth не поддерживается на этом устройстве');
      }

      // Проверяем состояние Bluetooth
      final adapterState = await FlutterBluePlus.adapterState.first;
      if (adapterState != BluetoothAdapterState.on) {
        throw Exception('Bluetooth отключён. Пожалуйста, включите Bluetooth');
      }

      // Запрашиваем разрешения
      await [
        Permission.bluetooth,
        Permission.bluetoothScan,
        Permission.bluetoothConnect,
        Permission.bluetoothAdvertise,
        Permission.locationWhenInUse,
      ].request();

      _isInitialized = true;
    } catch (e) {
      throw Exception('Ошибка инициализации Bluetooth: $e');
    }
  }

  @override
  Future<void> startDiscovery() async {
    if (!_isInitialized) {
      throw Exception('Bluetooth не инициализирован');
    }

    try {
      // Останавливаем предыдущее сканирование если есть
      await stopDiscovery();

      _foundDevices.clear();

      // Подписываемся на результаты сканирования
      _scanSubscription = FlutterBluePlus.scanResults.listen((results) {
        for (final result in results) {
          // Проверяем, есть ли наш сервис в рекламе
          final hasOurService = result.advertisementData.serviceUuids.any(
            (guid) => guid.str.toLowerCase() == _serviceUuid.toLowerCase(),
          );

          if (hasOurService) {
            _processDiscoveredDevice(result.device);
          }
        }
      });

      // Начинаем сканирование с автоматической остановкой через 30 секунд
      await FlutterBluePlus.startScan(
        withServices: [Guid(_serviceUuid)],
        timeout: const Duration(seconds: 30),
      );

      // Таймер для принудительной остановки сканирования
      _scanTimer?.cancel();
      _scanTimer = Timer(const Duration(seconds: 30), () async {
        try {
          await stopDiscovery();
          print('Сканирование автоматически остановлено через 30 секунд');
        } catch (e) {
          print('Ошибка автоматической остановки сканирования: $e');
        }
      });
    } catch (e) {
      throw Exception('Ошибка поиска устройств: $e');
    }
  }

  @override
  Future<void> stopDiscovery() async {
    await FlutterBluePlus.stopScan();
    await _scanSubscription?.cancel();
    _scanSubscription = null;
    _scanTimer?.cancel();
    _scanTimer = null;
  }

  /// Обновить поиск устройств (перезапустить сканирование)
  Future<void> refreshDiscovery() async {
    if (!_isInitialized) {
      throw Exception('Bluetooth не инициализирован');
    }

    try {
      await stopDiscovery();
      await Future.delayed(const Duration(milliseconds: 500));
      await startDiscovery();
    } catch (e) {
      throw Exception('Ошибка обновления поиска устройств: $e');
    }
  }

  @override
  Future<void> startAdvertising() async {
    // Реклама через flutter_blue_plus требует сложной настройки
    // Временно используем заглушку
    print('Ожидание подключения реализовано через открытие для обнаружения');

    // Можно реализовать:
    // 1. Периодическое сканирование для поиска других устройств
    // 2. Создание GATT сервера (реклама автоматическая)
    // 3. Обратное сканирование - другие устройства найдут нас
  }

  @override
  Future<void> stopAdvertising() async {
    // Заглушка для остановки рекламы
    print('Остановка ожидания подключения');
  }

  @override
  Stream<List<Device>> get discoveredDevices =>
      _discoveredDevicesController.stream;

  @override
  Future<void> connectToDevice(Device device) async {
    try {
      // Находим устройство по ID
      final btDevice = BluetoothDevice.fromId(device.id);
      _connectedDevice = btDevice;

      // Подключаемся
      await btDevice.connect(autoConnect: false);

      // Открываем сервисы
      final services = await btDevice.discoverServices();

      for (final service in services) {
        if (service.uuid.str.toLowerCase() == _serviceUuid.toLowerCase()) {
          for (final characteristic in service.characteristics) {
            // Настраиваем уведомления
            if (characteristic.properties.notify) {
              await characteristic.setNotifyValue(true);

              _dataSubscription = characteristic.lastValueStream.listen((data) {
                try {
                  final message = utf8.decode(data);
                  final jsonData = jsonDecode(message) as Map<String, dynamic>;
                  _incomingMessagesController.add(
                    MessageDto.fromJson(jsonData).toDomain(),
                  );
                } catch (e) {
                  print('Ошибка обработки входящих данных: $e');
                }
              });
            }

            // Настраиваем запись
            if (characteristic.properties.write) {
              _writeCharacteristic = characteristic;
            }
          }
          break;
        }
      }
    } catch (e) {
      throw Exception('Ошибка подключения к устройству: $e');
    }
  }

  @override
  Future<void> disconnect() async {
    await _dataSubscription?.cancel();
    _dataSubscription = null;
    await _connectedDevice?.disconnect();
    _connectedDevice = null;
    _writeCharacteristic = null;
  }

  @override
  Future<void> sendMessage(Message message) async {
    if (_connectedDevice == null || _writeCharacteristic == null) {
      throw Exception('Нет активного соединения или характеристики для записи');
    }

    try {
      final jsonMessage = jsonEncode(MessageDto.fromDomain(message).toJson());
      final bytesMessage = utf8.encode(jsonMessage);

      await _writeCharacteristic!.write(bytesMessage, withoutResponse: false);
    } catch (e) {
      throw Exception('Ошибка отправки данных: $e');
    }
  }

  @override
  Stream<Message> get incomingMessages => _incomingMessagesController.stream;

  @override
  bool get isConnected => _connectedDevice?.isConnected == true;

  @override
  Device? get connectedDevice => _connectedDevice != null
      ? Device(
          id: _connectedDevice!.remoteId.str,
          name: _connectedDevice!.platformName,
        )
      : null;

  void _processDiscoveredDevice(BluetoothDevice device) {
    final discovered = Device(
      id: device.remoteId.str,
      name: device.platformName.replaceFirst(
        AppConstants.bluetoothDevicePrefix,
        '',
      ),
    );

    if (_foundDevices.every((p) => p.id != discovered.id)) {
      _foundDevices.add(discovered);
      _discoveredDevicesController.add(List.unmodifiable(_foundDevices));
    }
  }

  @override
  void dispose() {
    _discoveredDevicesController.close();
    _incomingMessagesController.close();
    _scanSubscription?.cancel();
    _scanTimer?.cancel();
    _dataSubscription?.cancel();
    _connectedDevice?.disconnect();
  }
}
