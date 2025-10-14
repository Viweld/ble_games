import 'dart:async';

import 'package:batuga/core/domain/transport/i_transport_session_server.dart';
import 'package:bloc/bloc.dart';
import 'package:dep_gen/dep_gen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/domain/models/exceptions/bluetooth_exceptions.dart';

part 'events.dart';

part 'states.dart';

part 'server_session_bloc.freezed.dart';

/// BLoC для сессии сервера
@DepGen()
class ServerSessionBloc extends Bloc<ServerSessionEvent, ServerSessionState> {
  ServerSessionBloc({@DepArg() required ITransportSessionServer session})
    : _session = session,
      super(const ServerSessionState.view()) {
    on<ServerSessionEvent>(
      (event, emit) => switch (event) {
        ServerSessionEventOnInitializationRequested() =>
          _onInitializationRequested(event, emit),
        _ => throw UnimplementedError('Unhandled event: $event'),
      },
    );

    add(const ServerSessionEvent.onInitializationRequested());
  }

  final ITransportSessionServer _session;

  @override
  close() {
    unawaited(_session.stopAdvertising());
    return super.close();
  }

  /// Обработчик события запроса включения режима рекламы
  Future<void> _onInitializationRequested(
    ServerSessionEventOnInitializationRequested event,
    Emitter<ServerSessionState> emitter,
  ) async {
    try {
      //await _session.startAdvertising();
    } on BluetoothDisabledException {
      emitter(
        const ServerSessionState.error(
          message: 'Bluetooth выключен или недоступен',
        ),
      );
    } on Object {
      emitter(const ServerSessionState.error(message: 'Неизвестная ошибка'));
      rethrow;
    }
  }
}
