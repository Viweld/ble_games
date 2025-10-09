import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../models/device.dart';
import '../../models/user.dart';
import 'i_messenger.dart';

part 'connection_states.dart';

/// Базовый класс для менеджера подключения Bluetooth.
/// Содержит общие методы и свойства для управления состоянием подключения.
abstract base class BBluetoothConnectionManager {
  // ПУБЛИЧНЫЕ МЕТОДЫ И СВОЙСТВА
  // ---------------------------------------------------------------------------
  /// Текущее состояние подключения
  BluetoothConnectionState? get currentConnectionState =>
      _currentConnectionState;

  /// Поток состояний подключения
  Stream<BluetoothConnectionState> get connectionStateStream =>
      _connectionStateController.stream;

  IMessenger get messenger;

  /// Освободить ресурсы
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
