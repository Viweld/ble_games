import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../domain/services/i_bluetooth_state_service.dart';
import '../utils/open_android_bluetooth_pannel_util.dart';

class BluetoothStateService implements IBluetoothStateService {
  /// Проверить, включен ли Bluetooth
  @override
  Future<bool> isBluetoothEnabled() async {
    final state = FlutterBluePlus.adapterStateNow;
    return state != BluetoothAdapterState.off;
  }

  /// Запросить у пользователя включение Bluetooth
  /// Возвращает true, если Bluetooth включен, иначе false
  @override
  Future<bool> enableBluetooth() async {
    if (await isBluetoothEnabled()) return true;
    if (!kIsWeb && Platform.isAndroid) {
      await FlutterBluePlus.turnOn().catchError((_) {});
    }
    await Future.delayed(const Duration(seconds: 1));
    if (await isBluetoothEnabled()) return true;
    await _openBluetoothSettings();
    await Future.delayed(const Duration(seconds: 2));
    return await isBluetoothEnabled();
  }

  /// Открыть настройки Bluetooth
  Future<void> _openBluetoothSettings() async {
    if (Platform.isAndroid) {
      BluetoothEnablePanelUtil.open();
    } else if (Platform.isIOS) {
      await launchUrl(Uri.parse("App-Prefs:root=Bluetooth"));
    }
  }
}
