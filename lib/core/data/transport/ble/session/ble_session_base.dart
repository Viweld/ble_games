import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../../../domain/models/peer_endpoint.dart';
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
  TransportSessionState? _currentConnectionState;

  /// Контроллер потока состояний подключения
  final _connectionStateController =
      StreamController<TransportSessionState>.broadcast();

  /// поступил запрос на подключение
  @protected
  void initSessionState({required PeerEndpoint localPeer}) {
    _setConnectionState(TransportSessionDisconnected(localPeer: localPeer));
  }

  /// поступил запрос на подключение
  @protected
  void connectionRequested({required PeerEndpoint remotePeer}) {
    final state = _currentConnectionState;
    if (state is! TransportSessionDisconnected) {
      throw UnsupportedError(
        'Невозможен переход в TransportSessionAwaitingConfirmation из состояния ${_currentConnectionState.runtimeType}',
      );
    }
    _setConnectionState(
      TransportSessionAwaitingConfirmation(
        localPeer: state.localPeer,
        remotePeer: remotePeer,
      ),
    );
  }

  /// решено отклонить
  @protected
  void connectionRequestRejected() {
    final state = _currentConnectionState;
    if (state is! TransportSessionAwaitingConfirmation) {
      throw UnsupportedError(
        'Невозможен переход в TransportSessionDisconnected из состояния ${_currentConnectionState.runtimeType}',
      );
    }
    _setConnectionState(
      TransportSessionDisconnected(localPeer: state.localPeer),
    );
  }

  /// решено принять
  @protected
  void connectionRequestConfirmed() {
    final state = _currentConnectionState;
    if (state is! TransportSessionAwaitingConfirmation) {
      throw UnsupportedError(
        'Невозможен переход в TransportSessionConnected из состояния ${_currentConnectionState.runtimeType}',
      );
    }
    _setConnectionState(
      TransportSessionConnected(
        localPeer: state.localPeer,
        remotePeer: state.remotePeer,
      ),
    );
  }

  /// решено отключиться
  @protected
  void sessionDisconnected() {
    final state = _currentConnectionState;
    if (state is! TransportSessionConnected) {
      throw UnsupportedError(
        'Невозможен переход в TransportSessionDisconnected из состояния ${_currentConnectionState.runtimeType}',
      );
    }
    _setConnectionState(
      TransportSessionDisconnected(localPeer: state.localPeer),
    );
  }

  /// Устанавливает текущее состояние соединения и уведомляет слушателей
  void _setConnectionState(TransportSessionState state) {
    if (_currentConnectionState == state) return;
    _currentConnectionState = state;
    if (_connectionStateController.isClosed) return;
    _connectionStateController.add(state);
  }

  /// Освободить ресурсы в подклассах
  @protected
  Future<void> onDispose();
}
