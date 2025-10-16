import 'dart:async';

import 'package:batuga/core/domain/transport/i_transport_session_server.dart';
import 'package:bloc/bloc.dart';
import 'package:dep_gen/dep_gen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/domain/models/device.dart';
import '../../../../../../core/domain/models/exceptions/bluetooth_exceptions.dart';
import '../../../../../../core/domain/models/messages.dart';
import '../../../../../../core/domain/models/peer_endpoint.dart';
import '../../../../../../core/domain/models/user.dart';
import '../../../../../../core/domain/repositories/i_device_repository.dart';
import '../../../../../../core/domain/repositories/i_user_repository.dart';
import '../../../../../../core/domain/transport/i_transport_facade.dart';

part 'events.dart';

part 'states.dart';

part 'server_session_bloc.freezed.dart';

/// BLoC для сессии сервера
@DepGen()
class ServerSessionBloc extends Bloc<ServerSessionEvent, ServerSessionState> {
  ServerSessionBloc({
    @DepArg() required IUserRepository userRepo,
    @DepArg() required IDeviceRepository deviceRepo,
    @DepArg() required ITransportSessionServer session,
    @DepArg() required ITransportFacade transport,
  }) : _userRepo = userRepo,
       _deviceRepo = deviceRepo,
       _session = session,
       super(const ServerSessionState.invitationPending()) {
    on<ServerSessionEvent>(
      (event, emitter) => switch (event) {
        ServerSessionEventOnInitializationRequested() =>
          _onInitializationRequested(emitter),
        ServerSessionEventOnInvitationReceived() => _onInvitationReceived(
          event,
          emitter,
        ),
        ServerSessionEventOnAcceptTapped() => _onAcceptTapped(emitter),
        ServerSessionEventOnRejectTapped() => _onRejectTapped(emitter),
        _ => throw UnimplementedError('Unhandled event: $event'),
      },
    );

    _messagesStreamSubscription = transport.messagesStream.listen(
      _messagesStreamListener,
    );

    add(const ServerSessionEvent.onInitializationRequested());
  }

  final IUserRepository _userRepo;
  final IDeviceRepository _deviceRepo;
  final ITransportSessionServer _session;
  late final StreamSubscription<Message> _messagesStreamSubscription;

  @override
  Future<void> close() async {
    await _messagesStreamSubscription.cancel();
    await _session.stopAdvertising();
    return super.close();
  }

  void _messagesStreamListener(Message message) {
    if (isClosed) return;
    if (message is! InvitationMessage) return;
    add(
      ServerSessionEvent.onInvitationReceived(
        remoteUser: message.peerEndpoint.user,
        remoteDevice: message.peerEndpoint.device,
      ),
    );
  }

  /// Обработчик события запроса включения режима рекламы
  Future<void> _onInitializationRequested(
    Emitter<ServerSessionState> emitter,
  ) async {
    try {
      final user = await _userRepo.getCurrentUser();
      if (user == null) return;
      final device = await _deviceRepo.getDevice();
      await _session.startAdvertising(
        localPeer: PeerEndpoint(user: user, device: device),
      );
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

  /// Обработчик события "пользователь нажал принять приглашение"
  Future<void> _onAcceptTapped(Emitter<ServerSessionState> emitter) async {
    try {
      await _session.acceptInvitation();
    } finally {
      emitter(const ServerSessionState.closeDialog());
    }
  }

  /// Обработчик события "пользователь нажал отклонить приглашение"
  Future<void> _onRejectTapped(Emitter<ServerSessionState> emitter) async {
    try {
      await _session.rejectInvitation();
    } finally {
      emitter(const ServerSessionState.closeDialog());
    }
  }

  /// Обработчик события "поступило приглашение от удаленного устройств"
  Future<void> _onInvitationReceived(
    ServerSessionEventOnInvitationReceived event,
    Emitter<ServerSessionState> emitter,
  ) async {
    print('Меняем отображаемый визуал');
    emitter(
      ServerSessionState.userDecision(
        remoteUser: event.remoteUser,
        remoteDevice: event.remoteDevice,
      ),
    );
  }
}
