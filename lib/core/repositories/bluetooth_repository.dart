import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import '../constants/app_constants.dart';
import '../domain/models/player.dart';
import 'i_bluetooth_repository.dart';

/// Реализация репозитория Bluetooth на основе flutter_blue_plus
class BluetoothRepository implements IBluetoothRepository {
  BluetoothRepository() {
    _discoveredDevicesController = StreamController<List<Player>>.broadcast();
    _incomingDataController = StreamController<Map<String, dynamic>>.broadcast();
  }

  late final StreamController<List<Player>> _discoveredDevicesController;
  late final StreamController<Map<String, dynamic>> _incomingDataController;

  final List<Player> _foundPlayers = [];

  BluetoothDevice? _connectedDevice;
  StreamSubscription<List<ScanResult>>? _scanSub;
  StreamSubscription<List<int>>? _notifySub;
  bool _isInitialized = false;

  @override
  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      final supported = await FlutterBluePlus.isSupported;
      if (supported == false) throw Exception('Bluetooth не поддерживается');

      _isInitialized = true;
    } catch (e) {
      throw Exception('Ошибка инициализации BLE: $e');
    }
  }

  @override
  Future<void> startDiscovery() async {
    if (!_isInitialized) throw Exception('Bluetooth не инициализирован');

    try {
      _scanSub = FlutterBluePlus.scanResults.listen((results) {
        for (var result in results) {
          final name = result.device.name;
          if (name?.startsWith(AppConstants.bluetoothDevicePrefix) == true) {
            _processDiscoveredDevice(result.device);
          }
        }
      });

      await FlutterBluePlus.startScan(timeout: const Duration(seconds: 10));
    } catch (e) {
      throw Exception('Ошибка поиска устройств: $e');
    }
  }

  @override
  Future<void> stopDiscovery() async {
    await FlutterBluePlus.stopScan();
    await _scanSub?.cancel();
    _scanSub = null;
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
            _notifySub = c.value.listen((data) {
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
  bool get isConnected =>
      _connectedDevice != null && _notifySub != null;

  @override
  Player? get connectedDevice => _connectedDevice != null
      ? Player(
    id: _connectedDevice!.id.id,
    nickname: _connectedDevice!.name,
    deviceId: _connectedDevice!.id.id,
    deviceName: _connectedDevice!.name,
  )
      : null;

  void _processDiscoveredDevice(BluetoothDevice device) {
    final player = Player(
      id: device.id.id,
      nickname:
      device.name.replaceFirst(AppConstants.bluetoothDevicePrefix, ''),
      deviceId: device.id.id,
      deviceName: device.name,
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
    _notifySub?.cancel();
    _connectedDevice?.disconnect();
  }
}
