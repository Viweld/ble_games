import 'dart:async';

import 'package:batuga/core/domain/services/bluetooth_manager/i_bluetooth_connection.dart';
import 'package:bluetooth_low_energy/bluetooth_low_energy.dart';
import 'package:flutter/foundation.dart';

abstract base class BBluetoothConnector {
  // ПУБЛИЧНЫЕ МЕТОДЫ И СВОЙСТВА
  // ---------------------------------------------------------------------------
  /// Текущее состояние подключения
  BluetoothConnectState? get currentConnectionState => _currentConnectionState;

  /// Поток состояний подключения
  Stream<BluetoothConnectState> get connectionStateStream =>
      _connectionStateController.stream;

  Future<void> send Raw(Uint8List data);
  Stream<Uint8List> get incom ingRawData;

  // ЗАЩИЩЕННЫЕ МЕТОДЫ И СВОЙСТВА
  // ---------------------------------------------------------------------------
  /// Часть UUID для всех сервисов и характеристик приложения
  static const _appUuidPart = '0000-1000-8000-00805f9b34fb';

  /// UUID сервиса и характеристики приложения
  @protected
  final serviceUuid = UUID.fromString('0000a7c0-$_appUuidPart');

  /// UUID характеристики приложения
  @protected
  final characteristicUuid = UUID.fromString('0000a7c1-$_appUuidPart');

  /// Текущее состояние подключения
  BluetoothConnectState _currentConnectionState =
      const BluetoothDisconnectedState();

  /// Контроллер потока состояний подключения
  final _connectionStateController =
      StreamController<BluetoothConnectState>.broadcast();

  /// Устанавливает текущее состояние соединения и уведомляет слушателей
  @protected
  void setConnectionState(BluetoothConnectState state) {
    if (_currentConnectionState == state) return;
    _currentConnectionState = state;
    if (_connectionStateController.isClosed) return;
    _connectionStateController.add(state);
  }
}
