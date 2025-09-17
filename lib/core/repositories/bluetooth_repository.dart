import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:bluetooth_low_energy/bluetooth_low_energy.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import '../constants/app_constants.dart';
import '../data/dto/messages_dto.dart';
import '../domain/models/device.dart';
import '../domain/models/messages.dart';
import 'i_bluetooth_repository.dart';

/// Реализация репозитория Bluetooth на основе bluetooth_low_energy с выделением устройств приложения
class BluetoothRepository implements IBluetoothRepository {
  BluetoothRepository() {
    _discoveredDevicesController = StreamController<List<Device>>.broadcast();
    _incomingMessagesController = StreamController<Message>.broadcast();
    _initializeDeviceName();
  }

  late final StreamController<List<Device>> _discoveredDevicesController;
  late final StreamController<Message> _incomingMessagesController;

  final List<Device> _foundDevices = [];
  final Map<String, Peripheral> _discoveredPeripherals = {};

  late final CentralManager _centralManager;
  late final PeripheralManager _peripheralManager;

  Peripheral? _connectedPeripheral;
  GATTCharacteristic? _writeCharacteristic;
  StreamSubscription<DiscoveredEventArgs>? _scanSubscription;
  StreamSubscription<GATTCharacteristicNotifiedEventArgs>? _dataSubscription;
  StreamSubscription<GATTCharacteristicWriteRequestedEventArgs>?
  _writeRequestSubscription;

  bool _isInitialized = false;
  bool _isAdvertising = false;
  Timer? _scanTimer;

  // Наши UUID-ы
  final UUID _serviceUuid = UUID.fromString(
    '0000a7c0-0000-1000-8000-00805f9b34fb',
  );
  final UUID _characteristicUuid = UUID.fromString(
    '0000a7c1-0000-1000-8000-00805f9b34fb',
  );

  // Уникальное имя приложения для идентификации
  static const String _appName = '🎮BaTuGa';
  late String _deviceName;

  /// Инициализация имени устройства
  Future<void> _initializeDeviceName() async {
    try {
      final deviceInfo = DeviceInfoPlugin();
      final androidInfo = await deviceInfo.androidInfo;
      _deviceName = '$_appName-${androidInfo.model}';
    } catch (e) {
      _deviceName = '$_appName-Device';
    }
  }

  @override
  Future<void> initialize() async {
    print('\n🔵 Bluetooth инициализация начата...');
    if (_isInitialized) {
      print('✅ Bluetooth уже инициализирован');
      return;
    }

    try {
      // Запрашиваем разрешения
      print('Запрос разрешений Bluetooth...');
      final permissions = await [
        Permission.bluetooth,
        Permission.bluetoothScan,
        Permission.bluetoothConnect,
        Permission.bluetoothAdvertise,
        Permission.locationWhenInUse,
      ].request();
      print('Разрешения: $permissions');

      // Инициализируем менеджеры
      _centralManager = CentralManager();
      _peripheralManager = PeripheralManager();

      // Ожидаем готовности Bluetooth адаптера для центрального режима
      print('Проверка состояния Bluetooth адаптера...');
      if (_centralManager.state != BluetoothLowEnergyState.poweredOn) {
        await for (final state in _centralManager.stateChanged) {
          print('Состояние Central Bluetooth: $state');
          if (state.state == BluetoothLowEnergyState.poweredOn) {
            break;
          } else if (state.state == BluetoothLowEnergyState.poweredOff) {
            throw Exception(
              'Bluetooth отключён. Пожалуйста, включите Bluetooth',
            );
          }
        }
      }

      // Ожидаем готовности Bluetooth адаптера для периферийного режима
      if (_peripheralManager.state != BluetoothLowEnergyState.poweredOn) {
        await for (final state in _peripheralManager.stateChanged) {
          print('Состояние Peripheral Bluetooth: $state');
          if (state.state == BluetoothLowEnergyState.poweredOn) {
            break;
          } else if (state.state == BluetoothLowEnergyState.poweredOff) {
            throw Exception(
              'Bluetooth отключён. Пожалуйста, включите Bluetooth',
            );
          }
        }
      }

      _isInitialized = true;
      print('✅ Bluetooth успешно инициализирован');
      print('📱 Имя устройства: $_deviceName\n');
    } catch (e) {
      print('❌ Ошибка инициализации Bluetooth: $e');
      throw Exception('Ошибка инициализации Bluetooth: $e');
    }
  }

  @override
  Future<void> startDiscovery() async {
    if (!_isInitialized) {
      await initialize();
    }

    try {
      // Останавливаем предыдущее сканирование если есть
      await stopDiscovery();

      _foundDevices.clear();
      _discoveredPeripherals.clear();
      print('\n🔍 Запуск поиска Bluetooth устройств...');

      // Подписываемся на результаты сканирования
      _scanSubscription = _centralManager.discovered.listen((event) {
        final peripheral = event.peripheral;
        final advertisement = event.advertisement;

        final deviceName = advertisement.name ?? peripheral.uuid.toString();
        print('Найдено устройство: $deviceName (${peripheral.uuid})');
        print('  RSSI: ${event.rssi}');
        print('  Сервисы: ${advertisement.serviceUUIDs}');

        if (advertisement.manufacturerSpecificData.isNotEmpty) {
          print(
            '  Данные производителя: ${advertisement.manufacturerSpecificData.first.id}',
          );
        }

        // Проверяем, является ли устройство нашим приложением
        final isOurApp = _isOurApplication(advertisement);

        if (isOurApp) {
          print('  🎮 ЭТО НАШЕ ПРИЛОЖЕНИЕ! Выделяем в списке');
        }

        _processDiscoveredDevice(peripheral, advertisement, isOurApp);
      });

      // Начинаем сканирование
      // Ищем устройства с нашим сервисом, но также добавим все устройства для полноты
      await _centralManager.startDiscovery(
        serviceUUIDs: [], // Пустой список = поиск всех устройств
      );

      print('✅ Сканирование запущено, ожидание устройств...');

      // Таймер для автоматической остановки
      _scanTimer?.cancel();
      _scanTimer = Timer(const Duration(seconds: 30), () async {
        try {
          await stopDiscovery();
          print('🕐 Сканирование автоматически остановлено через 30 секунд');
        } catch (e) {
          print('❌ Ошибка автоматической остановки сканирования: $e');
        }
      });
    } catch (e) {
      print('❌ Ошибка запуска сканирования: $e');
      throw Exception('Ошибка поиска устройств: $e');
    }
  }

  @override
  Future<void> stopDiscovery() async {
    print('🛑 Остановка сканирования...');
    try {
      await _centralManager.stopDiscovery();
      await _scanSubscription?.cancel();
      _scanSubscription = null;
      _scanTimer?.cancel();
      _scanTimer = null;
      print('✅ Сканирование остановлено');
    } catch (e) {
      print('⚠️ Ошибка остановки сканирования: $e');
    }
  }

  /// Обновить поиск устройств (перезапустить сканирование)
  @override
  Future<void> refreshDiscovery() async {
    if (!_isInitialized) {
      await initialize();
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
    print('\n📡 Запуск рекламы Bluetooth сервиса...');

    try {
      if (!_isInitialized) {
        await initialize();
      }

      // Останавливаем предыдущую рекламу
      await stopAdvertising();

      // Создаем сервис с характеристикой
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

      // Добавляем сервис
      await _peripheralManager.addService(service);
      print('✅ Сервис добавлен');

      // Настраиваем обработку записи в характеристику
      _writeRequestSubscription = _peripheralManager
          .characteristicWriteRequested
          .listen((event) {
            print('📥 Получен запрос записи от ${event.central.uuid}');
            try {
              final message = utf8.decode(event.request.value);
              final jsonData = jsonDecode(message) as Map<String, dynamic>;
              _incomingMessagesController.add(
                MessageDto.fromJson(jsonData).toDomain(),
              );
              // Подтверждаем успешную запись
              _peripheralManager.respondWriteRequest(event.request);
            } catch (e) {
              print('❌ Ошибка обработки входящих данных: $e');
              _peripheralManager.respondWriteRequestWithError(
                event.request,
                error: GATTError.invalidAttributeValueLength,
              );
            }
          });

      // Начинаем рекламу с нашим именем и специальными данными
      await _peripheralManager.startAdvertising(
        Advertisement(
          name: _deviceName, // Уникальное имя с моделью устройства
          serviceUUIDs: [_serviceUuid],
          manufacturerSpecificData: [
            ManufacturerSpecificData(
              id: 0x0499, // Ruuvi Innovations Ltd. ID
              data: Uint8List.fromList([
                0x01,
                0x02,
                0x03,
              ]), // Маркер нашего приложения
            ),
          ],
        ),
      );

      _isAdvertising = true;
      print('✅ Реклама Bluetooth сервиса запущена');
      print('📱 Устройство видимо как: "$_deviceName"');
      print('🎯 Сервис: $_serviceUuid');
      print('📝 Ожидание подключения от другого устройства...\n');
    } catch (e) {
      print('❌ Ошибка запуска рекламы: $e');
      _isAdvertising = false;
      throw Exception('Ошибка запуска рекламы: $e');
    }
  }

  @override
  Future<void> stopAdvertising() async {
    if (!_isAdvertising) return;

    print('🛑 Остановка рекламы Bluetooth сервиса...');

    try {
      await _peripheralManager.stopAdvertising();
      await _writeRequestSubscription?.cancel();
      _writeRequestSubscription = null;
      _isAdvertising = false;
      print('✅ Реклама остановлена');
    } catch (e) {
      print('⚠️ Ошибка остановки рекламы: $e');
    }
  }

  @override
  Stream<List<Device>> get discoveredDevices =>
      _discoveredDevicesController.stream;

  @override
  Future<void> connectToDevice(Device device) async {
    print(
      '\n🔗 Попытка подключения к устройству: ${device.name} (${device.id})',
    );

    try {
      // Получаем сохраненный объект Peripheral
      final peripheral = _discoveredPeripherals[device.id];
      if (peripheral == null) {
        throw Exception('Устройство не найдено в списке обнаруженных');
      }

      _connectedPeripheral = peripheral;

      print('🔌 Начинаем подключение...');
      await _centralManager.connect(peripheral);

      print('🔍 Подключение установлено, поиск сервисов...');
      final services = await _centralManager.discoverGATT(peripheral);
      print('Найдено сервисов: ${services.length}');

      bool serviceFound = false;
      for (final service in services) {
        print('Проверяем сервис: ${service.uuid}');
        if (service.uuid == _serviceUuid) {
          print('✅ Найден наш сервис!');
          serviceFound = true;

          for (final characteristic in service.characteristics) {
            print('Найдена характеристика: ${characteristic.uuid}');

            if (characteristic.uuid == _characteristicUuid) {
              // Настраиваем уведомления
              if (characteristic.properties.contains(
                GATTCharacteristicProperty.notify,
              )) {
                await _centralManager.setCharacteristicNotifyState(
                  peripheral,
                  characteristic,
                  state: true,
                );
                print('✅ Настроены уведомления');

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
                      } catch (e) {
                        print('❌ Ошибка обработки входящих данных: $e');
                      }
                    });
              }

              // Сохраняем характеристику для записи
              if (characteristic.properties.contains(
                GATTCharacteristicProperty.write,
              )) {
                _writeCharacteristic = characteristic;
                print('✅ Настроена запись');
              }
            }
          }
          break;
        }
      }

      if (!serviceFound) {
        throw Exception('На устройстве не найден наш сервис $_serviceUuid');
      }

      print('✅ Подключение успешно завершено!');
    } catch (e) {
      print('❌ Ошибка подключения: $e');

      // Очищаем состояние при ошибке
      _connectedPeripheral = null;
      _writeCharacteristic = null;

      // Определяем тип ошибки и даём понятное объяснение
      if (e.toString().contains('timeout')) {
        throw Exception(
          'Превышено время ожидания подключения. Проверьте расстояние между устройствами.',
        );
      } else {
        throw Exception(
          'Устройство недоступно для подключения. Убедитесь, что другое устройство в режиме ожидания. Детали: $e',
        );
      }
    }
  }

  @override
  Future<void> disconnect() async {
    print('🔌 Отключение от устройства...');
    try {
      await _dataSubscription?.cancel();
      _dataSubscription = null;

      if (_connectedPeripheral != null) {
        await _centralManager.disconnect(_connectedPeripheral!);
      }

      _connectedPeripheral = null;
      _writeCharacteristic = null;
      print('✅ Отключение завершено');
    } catch (e) {
      print('⚠️ Ошибка отключения: $e');
    }
  }

  @override
  Future<void> sendMessage(Message message) async {
    if (_connectedPeripheral == null || _writeCharacteristic == null) {
      throw Exception('Нет активного соединения или характеристики для записи');
    }

    try {
      final jsonMessage = jsonEncode(MessageDto.fromDomain(message).toJson());
      final bytesMessage = Uint8List.fromList(utf8.encode(jsonMessage));

      await _centralManager.writeCharacteristic(
        _connectedPeripheral!,
        _writeCharacteristic!,
        value: bytesMessage,
        type: GATTCharacteristicWriteType.withResponse,
      );

      print('📤 Сообщение отправлено: $jsonMessage');
    } catch (e) {
      throw Exception('Ошибка отправки данных: $e');
    }
  }

  @override
  Stream<Message> get incomingMessages => _incomingMessagesController.stream;

  @override
  bool get isConnected => _connectedPeripheral != null;

  @override
  Device? get connectedDevice => _connectedPeripheral != null
      ? Device(
          id: _connectedPeripheral!.uuid.toString(),
          name: _connectedPeripheral!.uuid
              .toString(), // TODO: получить реальное имя
          isOurApp: false, // По умолчанию false для подключенного устройства
        )
      : null;

  /// Проверяет, является ли устройство нашим приложением
  bool _isOurApplication(Advertisement advertisement) {
    // Проверяем по имени устройства
    if (advertisement.name != null && advertisement.name!.contains(_appName)) {
      return true;
    }

    // Проверяем по сервису
    if (advertisement.serviceUUIDs.contains(_serviceUuid)) {
      return true;
    }

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

    // Сохраняем объект Peripheral для дальнейшего подключения
    _discoveredPeripherals[deviceId] = peripheral;

    // Формируем чистое имя устройства
    String cleanName = deviceName;

    // Убираем эмодзи и название приложения из имени
    if (cleanName.contains(_appName)) {
      cleanName = cleanName
          .replaceAll(_appName, '')
          .replaceAll('🎮', '')
          .trim();
      // Убираем лишние дефисы в начале
      if (cleanName.startsWith('-')) {
        cleanName = cleanName.substring(1);
      }
    }

    final discovered = Device(
      id: deviceId,
      name: cleanName.replaceFirst(AppConstants.bluetoothDevicePrefix, ''),
      // Добавляем флаг того, что это наше приложение
      isOurApp: isOurApp,
    );

    print(
      '🔍 Обработка найденного устройства: ${discovered.name}${isOurApp ? ' (🎮 наше приложение)' : ''}',
    );

    if (_foundDevices.every((p) => p.id != discovered.id)) {
      print('➕ Добавляем новое устройство: ${discovered.name}');

      // Если это наше приложение, ставим его в начало списка
      if (isOurApp) {
        _foundDevices.insert(0, discovered);
        print('⭐ Устройство с нашим приложением поставлено в начало списка');
      } else {
        _foundDevices.add(discovered);
      }

      _discoveredDevicesController.add(List.unmodifiable(_foundDevices));
      print('📋 Текущий список устройств: ${_foundDevices.length}');
    } else {
      print('ℹ️ Устройство уже в списке: ${discovered.name}');
    }
  }

  @override
  void dispose() {
    print('🧹 Очистка BluetoothRepository...');
    _discoveredDevicesController.close();
    _incomingMessagesController.close();
    _scanSubscription?.cancel();
    _scanTimer?.cancel();
    _dataSubscription?.cancel();
    _writeRequestSubscription?.cancel();
    stopAdvertising();
    stopDiscovery();
    disconnect();
    print('✅ BluetoothRepository очищен');
  }
}
