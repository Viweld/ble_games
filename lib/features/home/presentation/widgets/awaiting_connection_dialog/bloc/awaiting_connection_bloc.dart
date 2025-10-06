import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dep_gen/dep_gen.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/domain/models/exceptions/bluetooth_exceptions.dart';
import '../../../../../../core/domain/services/bluetooth_manager/i_bluetooth_manager.dart';

part 'events.dart';

part 'states.dart';

part 'awaiting_connection_bloc.freezed.dart';

/// BLoC для диалога ожидания подключения
@DepGen()
class AwaitingConnectionBloc
    extends Bloc<AwaitingConnectionEvent, AwaitingConnectionState> {
  AwaitingConnectionBloc({
    @DepArg() required IBluetoothManager bluetoothRepository,
  }) : _bluetoothRepository = bluetoothRepository,
       super(const AwaitingConnectionState.view()) {
    on<AwaitingConnectionEvent>(
      (event, emit) => switch (event) {
        AwaitingConnectionEventOnAdvertisingRequested() =>
          _onAdvertisingRequested(event, emit),
        _ => throw UnimplementedError('Unhandled event: $event'),
      },
    );

    _clientConnectionSubscription = _bluetoothRepository.clientConnections
        .listen(_handleClientConnection);

    add(const AwaitingConnectionEvent.onAdvertisingRequested());
  }

  final IBluetoothManager _bluetoothRepository;
  late final StreamSubscription<String> _clientConnectionSubscription;

  /// Обработка подключений клиентов (для сервера)
  void _handleClientConnection(String clientId) {
    // if (isClosed) return;
    // final currentState = state;
    // if (currentState is! HomeStateAwaitingConnection) return;
    // final currentUser = _currentUser ?? User(id: 'server_user', name: 'Сервер');
    // final invitationMessage = InvitationMessage(
    //   device: Device(id: clientId, name: 'Клиент', isOurApp: true),
    //   user: currentUser,
    // );
    // _bluetoothRepository.sendMessage(invitationMessage).catchError((error) {});
  }

  @override
  close() {
    _clientConnectionSubscription.cancel();
    unawaited(_bluetoothRepository.stopAdvertising());
    return super.close();
  }

  /// Обработчик события запроса включения режима рекламы
  Future<void> _onAdvertisingRequested(
    AwaitingConnectionEventOnAdvertisingRequested event,
    Emitter<AwaitingConnectionState> emitter,
  ) async {
    try {
      await _bluetoothRepository.startAdvertising();
    } on BluetoothDisabledException {
      emitter(
        AwaitingConnectionState.error(
          message: 'Bluetooth выключен или недоступен',
        ),
      );
    } on Object {
      emitter(AwaitingConnectionState.error(message: 'Неизвестная ошибка'));
      rethrow;
    }
  }
}
