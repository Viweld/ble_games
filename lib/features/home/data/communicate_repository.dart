import 'dart:async';
import 'dart:convert';

import 'package:device_info_plus/device_info_plus.dart';
import 'dart:typed_data';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_ble_peripheral/flutter_ble_peripheral.dart';
import 'package:permission_handler/permission_handler.dart';

import '../constants/app_constants.dart';
import '../domain/models/player.dart';
import '../data/dto/player_dto.dart';
import '../data/mapper/mapper.dart';
import '../domain/i_communicate_repository.dart';

/// Реализация репозитория Bluetooth на основе flutter_blue_plus
class CommunicateRepository implements ICommunicateRepository {
  CommunicateRepository() {
    _discoveredDevicesController = StreamController<List<Player>>.broadcast();
    _incomingDataController =
        StreamController<Map<String, dynamic>>.broadcast();
  }

  late final StreamController<List<Player>> _discoveredDevicesController;
  late final StreamController<Map<String, dynamic>> _incomingDataController;

  final List<Player> _foundPlayers = [];
  final Mapper _mapper = const Mapper();

  BluetoothDevice? _connectedDevice;
  StreamSubscription<List<ScanResult>>? _scanSub;
  StreamSubscription<List<int>>? _notifySub;
  bool _isInitialized = false;
  final FlutterBlePeripheral _peripheral = FlutterBlePeripheral();
  final String _serviceUuid = '0000a7c0-0000-1000-8000-00805f9b34fb';
  Timer? _scanTimer;

  @override
  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      final supported = await FlutterBluePlus.isSupported;
      if (supported == false) throw Exception('Bluetooth не поддерживается');

      // Разрешения
      await [
        Permission.bluetooth,
        Permission.bluetoothScan,
        Permission.bluetoothConnect,
        Permission.locationWhenInUse,
      ].request();

      _isInitialized = true;
    } catch (e) {
      throw Exception('Ошибка инициализации BLE: $e');
    }
  }

  @override
  Future<void> startDiscovery() async {
    if (!_isInitialized) throw Exception('Bluetooth не инициализирован');

    try {
      _foundPlayers.clear();
      _scanSub = FlutterBluePlus.scanResults.listen((results) {
        for (var result in results) {
          // Фильтрация по нашему сервису рекламирования
          final hasOurService = result.advertisementData.serviceUuids.any(
            (guid) => guid.str.toLowerCase() == _serviceUuid.toLowerCase(),
          );
          if (hasOurService) _processDiscoveredDevice(result.device);
        }
      });
      // Первый запуск сканирования
      await FlutterBluePlus.startScan(
        withServices: [Guid(_serviceUuid)],
        timeout: const Duration(seconds: 10),
      );
      // Периодическое сканирование
      _scanTimer?.cancel();
      _scanTimer = Timer.periodic(const Duration(seconds: 12), (_) async {
        try {
          await FlutterBluePlus.stopScan();
          await FlutterBluePlus.startScan(
            withServices: [Guid(_serviceUuid)],
            timeout: const Duration(seconds: 10),
          );
        } catch (_) {}
      });
    } catch (e) {
      throw Exception('Ошибка поиска устройств: $e');
    }
  }

  @override
  Future<void> stopDiscovery() async {
    await FlutterBluePlus.stopScan();
    await _scanSub?.cancel();
    _scanSub = null;
    _scanTimer?.cancel();
    _scanTimer = null;
  }

  @override
  Future<void> startAdvertising() async {
    final deviceInfo = await _getDeviceInfo();
    final settings = AdvertiseSettings(
      advertiseMode: AdvertiseMode.advertiseModeLowLatency,
      txPowerLevel: AdvertiseTxPower.advertiseTxPowerHigh,
      timeout: 0,
      connectable: true,
    );
    final data = AdvertiseData(
      serviceUuid: _serviceUuid,
      manufacturerId: 0x02E5,
      includeDeviceName: true,
      manufacturerData: Uint8List.fromList(
        (deviceInfo['model'] ?? 'device').codeUnits,
      ),
    );
    await _peripheral.start(advertiseSettings: settings, advertiseData: data);
  }

  @override
  Future<void> stopAdvertising() async {
    await _peripheral.stop();
  }

  @override
  Stream<List<Player>> get discoveredDevices =>
      _discoveredDevicesController.stream;

  @override
  Future<void> connectToDevice(Player player) async {
    try {
      final device = BluetoothDevice.fromId(player.deviceId);
      _connectedDevice = device;

      await device.connect(autoConnect: false);

      final services = await device.discoverServices();
      for (var service in services) {
        for (var c in service.characteristics) {
          if (c.properties.notify) {
            await c.setNotifyValue(true);
            _notifySub = c.lastValueStream.listen((data) {
              final message = utf8.decode(data);
              try {
                final jsonData = jsonDecode(message) as Map<String, dynamic>;
                _incomingDataController.add(jsonData);
              } catch (_) {
                // игнор некорректных данных
              }
            });
            break;
          }
        }
      }
    } catch (e) {
      throw Exception('Ошибка подключения к устройству: $e');
    }
  }

  @override
  Future<void> disconnect() async {
    _notifySub?.cancel();
    await _connectedDevice?.disconnect();
    _connectedDevice = null;
  }

  @override
  Future<void> sendData(Map<String, dynamic> data) async {
    if (_connectedDevice == null) {
      throw Exception('Нет активного соединения');
    }

    try {
      final jsonData = jsonEncode(data);
      final bytes = utf8.encode(jsonData);

      final services = await _connectedDevice!.discoverServices();
      for (var service in services) {
        for (var c in service.characteristics) {
          if (c.properties.write) {
            await c.write(bytes, withoutResponse: false);
            return;
          }
        }
      }
      throw Exception('Нет характеристики для записи');
    } catch (e) {
      throw Exception('Ошибка отправки данных: $e');
    }
  }

  @override
  Stream<Map<String, dynamic>> get incomingData =>
      _incomingDataController.stream;

  @override
  bool get isConnected => _connectedDevice != null && _notifySub != null;

  @override
  Player? get connectedDevice => _connectedDevice != null
      ? Player(
          id: _connectedDevice!.remoteId.str,
          nickname: _connectedDevice!.platformName,
          deviceId: _connectedDevice!.remoteId.str,
          deviceName: _connectedDevice!.platformName,
        )
      : null;

  @override
  Map<String, dynamic> buildInvitationMessage({
    required Player from,
    required Player to,
  }) => {
    'type': 'invitation',
    'from': _mapper.toDto(from).toJson(),
    'to': _mapper.toDto(to).toJson(),
  };

  @override
  Player parsePlayer(Map<String, dynamic> json) =>
      _mapper.fromDto(PlayerDto.fromJson(json));

  void _processDiscoveredDevice(BluetoothDevice device) {
    final player = Player(
      id: device.remoteId.str,
      nickname: device.platformName.replaceFirst(
        AppConstants.bluetoothDevicePrefix,
        '',
      ),
      deviceId: device.remoteId.str,
      deviceName: device.platformName,
    );

    if (_foundPlayers.every((p) => p.id != player.id)) {
      _foundPlayers.add(player);
      _discoveredDevicesController.add(List.unmodifiable(_foundPlayers));
    }
  }

  Future<Map<String, String>> _getDeviceInfo() async {
    final di = DeviceInfoPlugin();
    final androidInfo = await di.androidInfo;
    return {
      'model': androidInfo.model,
      'brand': androidInfo.brand,
      'device': androidInfo.device,
    };
  }

  @override
  void dispose() {
    _discoveredDevicesController.close();
    _incomingDataController.close();
    _scanSub?.cancel();
    _scanTimer?.cancel();
    _notifySub?.cancel();
    _connectedDevice?.disconnect();
    _peripheral.stop();
  }
}
