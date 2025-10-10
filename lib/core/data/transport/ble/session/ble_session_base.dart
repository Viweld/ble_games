import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../../../domain/transport/models/transport_session_state.dart';
import '../../../../domain/transport/i_transport_session.dart';

abstract base class BleSessionBase implements ITransportSession {
  // ПУБЛИЧНЫЕ МЕТОДЫ И СВОЙСТВА
  // ---------------------------------------------------------------------------
  @override
  TransportSessionState? get currentConnectionState => _currentConnectionState;

  @override
  Stream<TransportSessionState> get connectionStateStream =>
      _connectionStateController.stream;

  @override
  Future<void> dispose() async {
    await onDispose();
    await _connectionStateController.close();
  }

  // ЗАЩИЩЕННЫЕ И ПРИВАТНЫЕ МЕТОДЫ И СВОЙСТВА
  // ---------------------------------------------------------------------------
  /// Текущее состояние подключения
  TransportSessionState _currentConnectionState =
      const TransportSessionDisconnected();

  /// Контроллер потока состояний подключения
  final _connectionStateController =
      StreamController<TransportSessionState>.broadcast();

  /// Устанавливает текущее состояние соединения и уведомляет слушателей
  @protected
  void setConnectionState(TransportSessionState state) {
    if (_currentConnectionState == state) return;
    _currentConnectionState = state;
    if (_connectionStateController.isClosed) return;
    _connectionStateController.add(state);
  }

  /// Освободить ресурсы в подклассах
  @protected
  Future<void> onDispose();
}
