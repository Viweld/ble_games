import 'package:flutter/services.dart';

class BluetoothEnablePanelUtil {
  BluetoothEnablePanelUtil._();

  static const MethodChannel _channel = MethodChannel('bluetooth_channel');

  static Future<void> open() async {
    await _channel.invokeMethod('enableBluetooth');
  }
}
