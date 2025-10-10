// import 'dart:async';
// import 'dart:convert';
//
// import 'package:bluetooth_low_energy/bluetooth_low_energy.dart';
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
//
// import '../../constants/app_constants.dart';
// import '../../data/models/messages_dto.dart';
// import '../../domain/models/device.dart';
// import '../../domain/models/exceptions/bluetooth_exceptions.dart';
// import '../../domain/models/messages.dart';
// import '../../domain/models/user.dart';
// import '../../domain/services/bluetooth_manager/i_bluetooth_connection.dart';
// import '../../domain/services/bluetooth_manager/i_bluetooth_manager.dart';
// import '../../utils/ble_name_codec.dart';
// import '../models/user_dto.dart';
//
// /// Простой логгер для Bluetooth репозитория
// class _BluetoothLogger {
//   static void debug(String message) {
//     debugPrint('[Bluetooth] $message');
//   }
//
//   static void error(String message) {
//     debugPrint('[Bluetooth ERROR] $message');
//   }
// }
//
// /// Реализация репозитория Bluetooth на основе bluetooth_low_energy с выделением устройств приложения
// class BluetoothManager implements IBluetoothManager {
//   BluetoothManager() {
//     //_discoveredDevicesController = StreamController<List<Device>>.broadcast();
//     _incomingMessagesController = StreamController<Message>.broadcast();
//     _connectionStateController =
//         StreamController<BluetoothConnectState>.broadcast();
//   }
//
//   //late final CentralManager _centralManager;
//   //late final StreamController<List<Device>> _discoveredDevicesController;
//   late final StreamController<BluetoothConnectState> _connectionStateController;
//   // final List<Device> _foundDevices = [];
//   // final Map<String, Peripheral> _discoveredPeripherals = {};
//   // Peripheral? _connectedPeripheral;
//
//   // late final PeripheralManager _peripheralManager;
//   // final Map<String, Central> _connectedClients = {};
//   // final Map<String, Central> _unverifiedClients = {};
//
//   late final StreamController<Message> _incomingMessagesController;
//
//   // GATTCharacteristic? _writeCharacteristic;
//   // StreamSubscription<DiscoveredEventArgs>? _scanSubscription;
//   // StreamSubscription<GATTCharacteristicNotifiedEventArgs>? _dataSubscription;
//   // StreamSubscription<GATTCharacteristicWriteRequestedEventArgs>?
//   // _writeRequestSubscription;
//
//   bool _isInitialized = false;
//   // BluetoothConnectState _currentConnectionState =
//   //     const BluetoothDisconnectedState();
//
//   // Наши UUID-ы
//   static const String _appUuidPart = '0000-1000-8000-00805f9b34fb';
//   final _serviceUuid = UUID.fromString('0000a7c0-$_appUuidPart');
//   final _characteristicUuid = UUID.fromString('0000a7c1-$_appUuidPart');
//
//   // Уникальное имя приложения для идентификации
//   static const String _appName = '🎮BaTuGa';
//   late final String _deviceName;
//
//   // ---------------------------------------------------------------------------
//   @override
//   Stream<Message> get messagesStream => _incomingMessagesController.stream;
//
//   @override
//   BluetoothConnectState get currentConnectionState => _currentConnectionState;
//
//   // @override
//   // Device? get connectedDevice => _connectedPeripheral != null
//   //     ? Device(
//   //         id: _connectedPeripheral!.uuid.toString(),
//   //         name: _connectedPeripheral!.uuid.toString(),
//   //         isOurApp: false,
//   //       )
//   //     : null;
//
//   @override
//   Stream<BluetoothConnectState> get connectionStateStream =>
//       _connectionStateController.stream;
//
//   // @override
//   // Stream<List<Device>> get discoveredDevicesStream =>
//   //     _discoveredDevicesController.stream;
//
//   @override
//   Future<void> initialize() async {
//     if (_isInitialized) return;
//
//     try {
//       _deviceName = await _getDeviceName();
//       // _centralManager = CentralManager();
//       // _peripheralManager = PeripheralManager();
//       _isInitialized = true;
//     } catch (e) {
//       throw Exception('Ошибка инициализации Bluetooth: $e');
//     }
//   }
//
//   @override
//   Future<void> startDiscovery() async {
//     if (!_isInitialized) return;
//     //
//     // try {
//     //   // Останавливаем предыдущее сканирование если есть
//     //   await stopDiscovery();
//     //
//     //   _foundDevices.clear();
//     //   _discoveredPeripherals.clear();
//     //   _BluetoothLogger.debug('\n🔍 Запуск поиска Bluetooth устройств...');
//     //
//     //   // Подписываемся на результаты сканирования
//     //   _scanSubscription = _centralManager.discovered.listen((event) {
//     //     final peripheral = event.peripheral;
//     //     final advertisement = event.advertisement;
//     //     final isOurApp = _isOurApplication(advertisement);
//     //     _processDiscoveredDevice(peripheral, advertisement, isOurApp);
//     //   });
//     //
//     //   // Начинаем сканирование, ищем устройства с нашим сервисом
//     //   await _centralManager.startDiscovery(serviceUUIDs: [_serviceUuid]);
//     //
//     //   _BluetoothLogger.debug('✅ Сканирование запущено, ожидание устройств...');
//     // } catch (e) {
//     //   _BluetoothLogger.error('Ошибка запуска сканирования: $e');
//     //   throw Exception('Ошибка поиска устройств: $e');
//     // }
//   }
//
//   @override
//   Future<void> stopDiscovery() async {
//     // _BluetoothLogger.debug('🛑 Остановка сканирования...');
//     // try {
//     //   await _centralManager.stopDiscovery();
//     //   await _scanSubscription?.cancel();
//     //   _scanSubscription = null;
//     //   _BluetoothLogger.debug('✅ Сканирование остановлено');
//     // } catch (e) {
//     //   _BluetoothLogger.error('⚠️ Ошибка остановки сканирования: $e');
//     // }
//   }
//
//   @override
//   Future<void> refreshDiscovery() async {
//     if (!_isInitialized) return;
//     //
//     // try {
//     //   await stopDiscovery();
//     //   await Future.delayed(const Duration(milliseconds: 500));
//     //   await startDiscovery();
//     // } catch (e) {
//     //   throw Exception('Ошибка обновления поиска устройств: $e');
//     // }
//   }
//
//   @override
//   Future<void> startAdvertising() async {
//     if (!_isInitialized) return;
//     // _BluetoothLogger.debug('\n📡 Запуск рекламы Bluetooth сервиса...');
//     // try {
//     //   await stopAdvertising();
//     //
//     //   // Создаем характеристику для записи и уведомлений
//     //   _writeCharacteristic = GATTCharacteristic.mutable(
//     //     uuid: _characteristicUuid,
//     //     properties: [
//     //       GATTCharacteristicProperty.read,
//     //       GATTCharacteristicProperty.write,
//     //       GATTCharacteristicProperty.notify,
//     //     ],
//     //     permissions: [
//     //       GATTCharacteristicPermission.read,
//     //       GATTCharacteristicPermission.write,
//     //     ],
//     //     descriptors: [],
//     //   );
//     //
//     //   // Создаем сервис с характеристикой
//     //   final service = GATTService(
//     //     uuid: _serviceUuid,
//     //     isPrimary: true,
//     //     includedServices: [],
//     //     characteristics: [_writeCharacteristic!],
//     //   );
//     //
//     //   // Добавляем сервис
//     //   await _peripheralManager.addService(service);
//     //   _BluetoothLogger.debug('✅ Сервис добавлен');
//     //
//     //   // Настраиваем обработку записи в характеристику
//     //   _writeRequestSubscription = _peripheralManager
//     //       .characteristicWriteRequested
//     //       .listen(_peripheralEventHandler);
//     //
//     //   // Начинаем рекламу с нашим именем и специальными данными
//     //   await _peripheralManager.startAdvertising(
//     //     Advertisement(name: _deviceName, serviceUUIDs: [_serviceUuid]),
//     //   );
//     // } on Object catch (e) {
//     //   _BluetoothLogger.error('❌ Ошибка запуска рекламы: $e');
//     //   if (e is! PlatformException) rethrow;
//     //   if (e.code.contains('IllegalStateException')) {
//     //     throw BluetoothDisabledException();
//     //   } else {
//     //     rethrow;
//     //   }
//     // }
//   }
//
//   // void _peripheralEventHandler(
//   //   GATTCharacteristicWriteRequestedEventArgs event,
//   // ) {
//   //   _BluetoothLogger.debug('📥 Получен запрос записи от ${event.central.uuid}');
//   //
//   //   try {
//   //     final rawMessage = utf8.decode(event.request.value);
//   //     _BluetoothLogger.debug('📥 Входящее сообщение: $rawMessage');
//   //     final jsonData = jsonDecode(rawMessage) as Map<String, dynamic>;
//   //     final message = MessageDto.fromJson(jsonData).toDomain();
//   //     if (message is InvitationMessage) {
//   //       _centralInvitationMessageHandler(event, message);
//   //     }
//   //     _incomingMessagesController.add(message);
//   //     _peripheralManager.respondWriteRequest(event.request);
//   //   } catch (e) {
//   //     _BluetoothLogger.error('❌ Ошибка обработки входящих данных: $e');
//   //     _peripheralManager.respondWriteRequestWithError(
//   //       event.request,
//   //       error: GATTError.invalidAttributeValueLength,
//   //     );
//   //   }
//   // }
//
//   // void _centralInvitationMessageHandler(
//   //   GATTCharacteristicWriteRequestedEventArgs event,
//   //   InvitationMessage message,
//   // ) {
//   //   // Проверяем, является ли клиент новым и сохраняем
//   //   final central = event.central;
//   //   final clientId = central.uuid.toString();
//   //   if (_connectedClients.keys.contains(clientId)) return;
//   //   _BluetoothLogger.debug('🆕 Новое подключение клиента: $clientId');
//   //   _setConnectionState(
//   //     BluetoothReceivedInvitationState(
//   //       user: message.user,
//   //       device: message.device,
//   //     ),
//   //   );
//   //   _unverifiedClients.addAll({clientId: central});
//   // }
//
//   @override
//   Future<void> stopAdvertising() async {
//     // _BluetoothLogger.debug('🛑 Остановка рекламы Bluetooth сервиса...');
//     //
//     // try {
//     //   await _peripheralManager.stopAdvertising();
//     //   await _writeRequestSubscription?.cancel();
//     //   _writeRequestSubscription = null;
//     // } catch (e) {
//     //   _BluetoothLogger.error('⚠️ Ошибка остановки рекламы: $e');
//     // }
//   }
//
//   @override
//   Future<void> connectToDevice(Device device) async {
//     // _setConnectionState(const BluetoothReceiveInvitationState());
//     // _BluetoothLogger.debug(
//     //   '\n🔗 Попытка подключения к устройству: ${device.name} (${device.id})',
//     // );
//     //
//     // try {
//     //   // Получаем сохраненный объект Peripheral
//     //   final peripheral = _discoveredPeripherals[device.id];
//     //   if (peripheral == null) {
//     //     throw Exception('Устройство не найдено в списке обнаруженных');
//     //   }
//     //
//     //   _connectedPeripheral = peripheral;
//     //   await _centralManager.connect(peripheral);
//     //   _BluetoothLogger.debug('✅ Подключение установлено');
//     //   final services = await _centralManager.discoverGATT(peripheral);
//     //
//     //   bool serviceFound = false;
//     //   for (final service in services) {
//     //     _BluetoothLogger.debug('Проверяем сервис: ${service.uuid}');
//     //     if (service.uuid == _serviceUuid) {
//     //       _BluetoothLogger.debug('✅ Найден наш сервис!');
//     //       serviceFound = true;
//     //
//     //       for (final characteristic in service.characteristics) {
//     //         _BluetoothLogger.debug(
//     //           'Найдена характеристика: ${characteristic.uuid}',
//     //         );
//     //
//     //         if (characteristic.uuid == _characteristicUuid) {
//     //           // Настраиваем уведомления
//     //           if (characteristic.properties.contains(
//     //             GATTCharacteristicProperty.notify,
//     //           )) {
//     //             await _centralManager.setCharacteristicNotifyState(
//     //               peripheral,
//     //               characteristic,
//     //               state: true,
//     //             );
//     //
//     //             _dataSubscription = _centralManager.characteristicNotified
//     //                 .where(
//     //                   (args) => args.characteristic.uuid == _characteristicUuid,
//     //                 )
//     //                 .listen((event) {
//     //                   try {
//     //                     final message = utf8.decode(event.value);
//     //                     _BluetoothLogger.debug(
//     //                       '📥 Входящее сообщение: $message',
//     //                     );
//     //                     final jsonData =
//     //                         jsonDecode(message) as Map<String, dynamic>;
//     //                     _incomingMessagesController.add(
//     //                       MessageDto.fromJson(jsonData).toDomain(),
//     //                     );
//     //                   } catch (e) {
//     //                     _BluetoothLogger.error(
//     //                       '❌ Ошибка обработки входящих данных: $e',
//     //                     );
//     //                   }
//     //                 });
//     //           }
//     //
//     //           // Сохраняем характеристику для записи
//     //           // Проверяем, поддерживает ли характеристика запись с подтверждением или без
//     //           if (characteristic.properties.contains(
//     //                 GATTCharacteristicProperty.write,
//     //               ) ||
//     //               characteristic.properties.contains(
//     //                 GATTCharacteristicProperty.writeWithoutResponse,
//     //               )) {
//     //             _writeCharacteristic = characteristic;
//     //           }
//     //         }
//     //       }
//     //       break;
//     //     }
//     //   }
//     //
//     //   if (!serviceFound) {
//     //     throw Exception('На устройстве не найден наш сервис $_serviceUuid');
//     //   }
//     //
//     //   await _centralManager
//     //       .requestMTU(peripheral, mtu: 512)
//     //       .catchError((_) => 0);
//     //
//     //   // Небольшая задержка для стабилизации соединения
//     //   await Future.delayed(const Duration(milliseconds: 300));
//     // } catch (e) {
//     //   _BluetoothLogger.error('❌ Ошибка подключения: $e');
//     //
//     //   // Очищаем состояние при ошибке
//     //   _connectedPeripheral = null;
//     //   _writeCharacteristic = null;
//     //
//     //   // Определяем тип ошибки и даём понятное объяснение
//     //   if (e.toString().contains('timeout')) {
//     //     throw Exception(
//     //       'Превышено время ожидания подключения. Проверьте расстояние между устройствами.',
//     //     );
//     //   } else if (e.toString().contains('not found')) {
//     //     throw Exception(
//     //       'Устройство не найдено. Убедитесь, что другое устройство в режиме ожидания.',
//     //     );
//     //   } else {
//     //     throw Exception(
//     //       'Устройство недоступно для подключения. Убедитесь, что другое устройство в режиме ожидания. Детали: $e',
//     //     );
//     //   }
//     // }
//   }
//
//   @override
//   Future<void> disconnect() async {
//     // _BluetoothLogger.debug('🔌 Отключение от устройства...');
//     // try {
//     //   _connectedClients.clear();
//     //   // await _dataSubscription?.cancel();
//     //   // _dataSubscription = null;
//     //   // if (_connectedPeripheral != null) {
//     //   //   await _centralManager.disconnect(_connectedPeripheral!);
//     //   // }
//     //   // _connectedPeripheral = null;
//     //   _writeCharacteristic = null;
//     // } catch (e) {
//     //   _BluetoothLogger.error('⚠️ Ошибка отключения: $e');
//     // }
//   }
//
//   @override
//   Future<void> sendMessage(Message message) async {
//     // _BluetoothLogger.debug('📤 Попытка отправки сообщения...');
//     // if (_connectedPeripheral == null || _writeCharacteristic == null) {
//     //   throw Exception('Нет активного соединения или характеристики для записи');
//     // }
//     //
//     // try {
//     //   _BluetoothLogger.debug('📤 Отправка сообщения ${message.runtimeType}');
//     //   await _centralManager.writeCharacteristic(
//     //     _connectedPeripheral!,
//     //     _writeCharacteristic!,
//     //     value: _convertMessageToBytes(message),
//     //     type: GATTCharacteristicWriteType.withoutResponse,
//     //   );
//     // } on Exception catch (e) {
//     //   _BluetoothLogger.error('❌ Ошибка отправки данных: $e');
//     //   if (!_isGattError133(e)) {
//     //     throw Exception('Ошибка отправки данных: $e');
//     //   } else {
//     //     await _resetConnection();
//     //     throw Exception(
//     //       'Ошибка соединения Bluetooth (статус 133). Соединение было сброшено. Пожалуйста, подключитесь заново к устройству.',
//     //     );
//     //   }
//     // }
//   }
//
//   Uint8List _convertMessageToBytes(Message message) {
//     final jsonMessage = jsonEncode(MessageDto.fromDomain(message).toJson());
//     _BluetoothLogger.debug('📤 Подготовка сообщения: $jsonMessage');
//     return Uint8List.fromList(utf8.encode(jsonMessage));
//   }
//
//   Future<void> notifyClients(Message message) async {
//     // if (_connectedClients.isEmpty) {
//     //   _BluetoothLogger.debug('⚠️ Нет подключённых клиентов для уведомления');
//     //   return;
//     // }
//     //
//     // try {
//     //   final jsonMessage = jsonEncode(MessageDto.fromDomain(message).toJson());
//     //   final bytes = Uint8List.fromList(utf8.encode(jsonMessage));
//     //
//     //   _BluetoothLogger.debug(
//     //     '📢 Отправка уведомления всем клиентам: $jsonMessage',
//     //   );
//     //
//     //   for (final client in _connectedClients.entries) {
//     //     try {
//     //       await _peripheralManager.notifyCharacteristic(
//     //         client.value,
//     //         _writeCharacteristic!,
//     //         value: bytes,
//     //       );
//     //       _BluetoothLogger.debug(
//     //         '📤 Уведомление отправлено клиенту: ${client.key}',
//     //       );
//     //     } catch (e) {
//     //       _BluetoothLogger.error(
//     //         '❌ Ошибка уведомления клиента ${client.key}: $e',
//     //       );
//     //     }
//     //   }
//     // } catch (e) {
//     //   _BluetoothLogger.error('❌ Ошибка сериализации уведомления: $e');
//     // }
//   }
//
//   @override
//   Future<void> dispose() async {
//     _BluetoothLogger.debug('🧹 Очистка BluetoothRepository...');
//     //_discoveredDevicesController.close();
//     // _incomingMessagesController.close();
//     // _connectionStateController.close();
//     // _scanSubscription?.cancel();
//     // _dataSubscription?.cancel();
//     // _writeRequestSubscription?.cancel();
//     // _connectedClients.clear();
//     // stopAdvertising();
//     // stopDiscovery();
//     // disconnect();
//   }
//
//   /// Получение имени устройства
//   Future<String> _getDeviceName() async {
//     try {
//       final androidInfo = await DeviceInfoPlugin().androidInfo;
//       return '$_appName-${androidInfo.model}';
//     } catch (e) {
//       return '$_appName-Device';
//     }
//   }
//
//   /// Устанавливает текущее состояние соединения и уведомляет слушателей
//   void _setConnectionState(BluetoothConnectState state) {
//     if (_currentConnectionState == state) return;
//     _currentConnectionState = state;
//     if (_connectionStateController.isClosed) return;
//     _connectionStateController.add(state);
//   }
//
//   // /// Проверяет, является ли устройство нашим приложением
//   // bool _isOurApplication(Advertisement advertisement) {
//   //   // Проверяем по имени устройства
//   //   if (advertisement.name?.contains(_appName) == true) return true;
//   //
//   //   // Проверяем по сервису
//   //   if (advertisement.serviceUUIDs.contains(_serviceUuid)) return true;
//   //
//   //   // Проверяем по manufacturer data
//   //   final manufacturerDataList = advertisement.manufacturerSpecificData;
//   //   if (manufacturerDataList.isNotEmpty) {
//   //     // Ищем наш маркер в любом из manufacturer data
//   //     for (final data in manufacturerDataList) {
//   //       if (data.id == 0x0499 &&
//   //           data.data.length >= 3 &&
//   //           data.data[0] == 0x01 &&
//   //           data.data[1] == 0x02 &&
//   //           data.data[2] == 0x03) {
//   //         return true;
//   //       }
//   //     }
//   //   }
//   //   return false;
//   // }
//
//   // /// Обрабатывает найденное устройство
//   // void _processDiscoveredDevice(
//   //   Peripheral peripheral,
//   //   Advertisement advertisement,
//   //   bool isOurApp,
//   // ) {
//   //   final deviceName = advertisement.name ?? peripheral.uuid.toString();
//   //   final deviceId = peripheral.uuid.toString();
//   //   _discoveredPeripherals[deviceId] = peripheral;
//   //
//   //   final cleanName = _getCleanDeviceName(deviceName, _appName);
//   //
//   //   final discovered = Device(
//   //     id: deviceId,
//   //     name: cleanName.replaceFirst(AppConstants.bluetoothDevicePrefix, ''),
//   //     isOurApp: isOurApp,
//   //   );
//   //
//   //   if (!_foundDevices.every((p) => p.id != discovered.id)) return;
//   //   isOurApp
//   //       ? _foundDevices.insert(0, discovered)
//   //       : _foundDevices.add(discovered);
//   //   _discoveredDevicesController.add(List.unmodifiable(_foundDevices));
//   // }
//
//   // /// Очищает имя устройства от названия приложения и лишних символов
//   // String _getCleanDeviceName(String deviceName, String appName) {
//   //   if (!deviceName.contains(appName)) return deviceName;
//   //   var cleanName = deviceName
//   //       .replaceAll(appName, '')
//   //       .replaceAll('🎮', '')
//   //       .trim();
//   //   return (cleanName.startsWith('-'))
//   //       ? cleanName.substring(1).trim()
//   //       : cleanName;
//   // }
//
//   // /// Проверяет, является ли ошибка ошибкой статуса 133
//   // bool _isGattError133(Exception e) {
//   //   return e.toString().contains('status: 133') ||
//   //       e.toString().contains('GATT_ERROR') ||
//   //       e.toString().contains('IllegalStateException');
//   // }
//
//   // /// Метод для сброса соединения и попытки переподключения
//   // Future<void> _resetConnection() async {
//   //   _BluetoothLogger.debug('🔄 Сброс соединения...');
//   //   try {
//   //     await disconnect();
//   //     _connectedPeripheral = null;
//   //     _writeCharacteristic = null;
//   //     await Future.delayed(const Duration(milliseconds: 500));
//   //   } catch (e) {
//   //     _BluetoothLogger.error('❌ Ошибка сброса соединения: $e');
//   //   }
//   // }
// }
