import 'dart:async';

import 'package:batuga/core/domain/transport/bluetooth/i_connection_manager.dart';
import 'package:flutter/foundation.dart';

import 'connection_states.dart';
import 'i_messenger.dart';

/// Базовый класс для менеджера подключения Bluetooth.
/// Содержит общие методы и свойства для управления состоянием подключения.
abstract base class BBluetoothConnectionManager implements IConnectionManager {
  // ПУБЛИЧНЫЕ МЕТОДЫ И СВОЙСТВА
  // ---------------------------------------------------------------------------
  @override
  BluetoothConnectionState? get currentConnectionState =>
      _currentConnectionState;

  @override
  Stream<BluetoothConnectionState> get connectionStateStream =>
      _connectionStateController.stream;

  @override
  IMessenger get messenger;

  @override
  Future<void> dispose() async {
    await onDispose();
    await _connectionStateController.close();
  }

  // ЗАЩИЩЕННЫЕ И ПРИВАТНЫЕ МЕТОДЫ И СВОЙСТВА
  // ---------------------------------------------------------------------------
  /// Текущее состояние подключения
  BluetoothConnectionState _currentConnectionState =
      const BluetoothDisconnectedState();

  /// Контроллер потока состояний подключения
  final _connectionStateController =
      StreamController<BluetoothConnectionState>.broadcast();

  /// Устанавливает текущее состояние соединения и уведомляет слушателей
  @protected
  void setConnectionState(BluetoothConnectionState state) {
    if (_currentConnectionState == state) return;
    _currentConnectionState = state;
    if (_connectionStateController.isClosed) return;
    _connectionStateController.add(state);
  }

  /// Освободить ресурсы в подклассах
  @protected
  Future<void> onDispose();
}
