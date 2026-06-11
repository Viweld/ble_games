import 'dart:async';

import 'package:ble_peer_session/ble_peer_session.dart';
import 'package:bloc/bloc.dart';
import 'package:dep_gen/dep_gen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/domain/models/user.dart';
import '../../../../../../core/domain/repositories/device_repository.dart';
import '../../../../../../core/domain/repositories/user_repository.dart';
import '../../../../../../core/transport/peer_endpoint_mapper.dart';

part 'events.dart';

part 'states.dart';

part 'server_session_bloc.freezed.dart';

/// BLoC для сессии сервера
@DepGen()
class ServerSessionBloc extends Bloc<ServerSessionEvent, ServerSessionState> {
  ServerSessionBloc({
    @DepArg() required UserRepository userRepo,
    @DepArg() required DeviceRepository deviceRepo,
    @DepArg() required TransportSessionServer session,
    @DepArg() required TransportFacade transport,
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

  final UserRepository _userRepo;
  final DeviceRepository _deviceRepo;
  final TransportSessionServer _session;
  late final StreamSubscription<TransportMessage> _messagesStreamSubscription;

  @override
  Future<void> close() async {
    await _messagesStreamSubscription.cancel();
    await _session.stopAdvertising();
    return super.close();
  }

  void _messagesStreamListener(TransportMessage message) {
    if (isClosed) return;
    if (message is! InvitationMessage) return;
    add(
      ServerSessionEvent.onInvitationReceived(
        remoteUser: userFromPeerIdentity(message.peerEndpoint.identity),
        remoteDevice: message.peerEndpoint.device,
      ),
    );
  }

  Future<void> _onInitializationRequested(
    Emitter<ServerSessionState> emitter,
  ) async {
    try {
      final user = await _userRepo.getCurrentUser();
      if (user == null) return;
      final device = await _deviceRepo.getDevice();
      await _session.startAdvertising(
        localPeer: buildPeerEndpoint(user: user, device: device),
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

  Future<void> _onInvitationReceived(
    ServerSessionEventOnInvitationReceived event,
    Emitter<ServerSessionState> emitter,
  ) async {
    emitter(
      ServerSessionState.userDecision(
        remoteUser: event.remoteUser,
        remoteDevice: event.remoteDevice,
      ),
    );
  }

  Future<void> _onAcceptTapped(Emitter<ServerSessionState> emitter) async {
    await _session.acceptInvitation();
    emitter(const ServerSessionState.closeDialog());
  }

  Future<void> _onRejectTapped(Emitter<ServerSessionState> emitter) async {
    await _session.rejectInvitation();
    emitter(const ServerSessionState.invitationPending());
  }
}
