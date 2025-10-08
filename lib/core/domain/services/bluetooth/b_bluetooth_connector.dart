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

  /// Поток входящих сырых данных
  Stream<Uint8List> get incomingRawMessageStream =>
      _incomingRawMessageController.stream;

  /// Отправить сырые данные
  Future<void> sendRawMessage(Uint8List data);

  /// Отключиться от устройства
  Future<void> disconnect();

  /// Освободить ресурсы
  @protected
  Future<void> dispose() async {
    _connectionStateController.close();
    _incomingRawMessageController.close();
  }

  // ЗАЩИЩЕННЫЕ МЕТОДЫ И СВОЙСТВА
  // ---------------------------------------------------------------------------
  /// Текущее состояние подключения
  BluetoothConnectState _currentConnectionState =
      const BluetoothDisconnectedState();

  /// Контроллер потока состояний подключения
  final _connectionStateController =
      StreamController<BluetoothConnectState>.broadcast();

  /// Контроллер потока входящих сырых данных
  final _incomingRawMessageController = StreamController<Uint8List>.broadcast();

  /// Часть UUID для всех сервисов и характеристик приложения
  static const _appUuidPart = '0000-1000-8000-00805f9b34fb';

  /// UUID сервиса и характеристики приложения
  @protected
  final serviceUuid = UUID.fromString('0000a7c0-$_appUuidPart');

  /// UUID характеристики приложения
  @protected
  final characteristicUuid = UUID.fromString('0000a7c1-$_appUuidPart');

  /// Уникальное имя приложения для идентификации
  @protected
  late final appName = '🎮BaTuGa';

  /// Уникальное имя устройства для идентификации
  @protected
  late final deviceName = '$appName-УСТРОЙСТВО';

  /// Переводит входящие сырые данные в поток
  @protected
  void translateIncomingData(Uint8List value) {
    if (_incomingRawMessageController.isClosed) return;
    _incomingRawMessageController.add(value);
  }

  /// Устанавливает текущее состояние соединения и уведомляет слушателей
  @protected
  void setConnectionState(BluetoothConnectState state) {
    if (_currentConnectionState == state) return;
    _currentConnectionState = state;
    if (_connectionStateController.isClosed) return;
    _connectionStateController.add(state);
  }
}
