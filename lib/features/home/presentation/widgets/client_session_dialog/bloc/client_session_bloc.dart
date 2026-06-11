import 'dart:async';

import 'package:ble_peer_session/ble_peer_session.dart';
import 'package:bloc/bloc.dart';
import 'package:dep_gen/dep_gen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/domain/repositories/device_repository.dart';
import '../../../../../../core/domain/repositories/user_repository.dart';
import '../../../../../../core/transport/peer_endpoint_mapper.dart';

part 'events.dart';

part 'states.dart';

part 'client_session_bloc.freezed.dart';

/// BLoC для диалога ожидания подключения
@DepGen()
class ClientSessionBloc extends Bloc<ClientSessionEvent, ClientSessionState> {
  ClientSessionBloc({
    @DepArg() required UserRepository userRepo,
    @DepArg() required DeviceRepository deviceRepo,
    @DepArg() required TransportSessionClient session,
    @DepArg() required TransportFacade transport,
  }) : _userRepo = userRepo,
       _deviceRepo = deviceRepo,
       _session = session,
       super(const ClientSessionState.initializationPending()) {
    on<ClientSessionEvent>(
      (event, emitter) => switch (event) {
        ClientSessionEventOnViewStateChanged() => emitter(_viewState),
        ClientSessionEventOnInitializationRequested() =>
          _onInitializationRequested(event, emitter),
        ClientSessionEventOnConnectToDevice() => _onConnectToDevice(emitter),
        ClientSessionEventOnDeviceSelected() => _onDeviceSelected(
          event,
          emitter,
        ),
        ClientSessionEventOnInvitationAccepted() => _onInvitationAccepted(
          emitter,
        ),
        ClientSessionEventOnInvitationRejected() => _onInvitationRejected(
          emitter,
        ),
        _ => throw UnimplementedError('Unhandled event: $event'),
      },
    );

    _discoveredDevicesSubscription = session.discoveredDevicesStream.listen(
      _discoveredDevicesListener,
    );
    _messagesStreamSubscription = transport.messagesStream.listen(
      _messagesStreamListener,
    );

    add(const ClientSessionEvent.onInitializationRequested());
  }

  final UserRepository _userRepo;
  final DeviceRepository _deviceRepo;
  final TransportSessionClient _session;
  late final StreamSubscription<List<Device>> _discoveredDevicesSubscription;
  late final StreamSubscription<TransportMessage> _messagesStreamSubscription;

  late ClientSessionStateView _viewState;

  @override
  Future<void> close() async {
    await _discoveredDevicesSubscription.cancel();
    await _messagesStreamSubscription.cancel();
    await _session.stopDiscovery();
    return super.close();
  }

  void _discoveredDevicesListener(List<Device> devices) {
    if (isClosed) return;
    _viewState = _viewState.copyWith(devices: devices);
    add(const ClientSessionEvent.onViewStateChanged());
  }

  void _messagesStreamListener(TransportMessage event) {
    if (isClosed) return;
    switch (event) {
      case AcceptanceMessage():
        add(const ClientSessionEvent.onInvitationAccepted());
      case RejectionMessage():
        add(const ClientSessionEvent.onInvitationRejected());
      default:
        break;
    }
  }

  Future<void> _onInitializationRequested(
    ClientSessionEventOnInitializationRequested event,
    Emitter<ClientSessionState> emitter,
  ) async {
    try {
      _viewState = const ClientSessionState.view() as ClientSessionStateView;
      final user = await _userRepo.getCurrentUser();
      if (user == null) return;
      final device = await _deviceRepo.getDevice();
      await _session.startDiscovery(
        localPeer: buildPeerEndpoint(user: user, device: device),
      );
    } catch (e) {
      emitter(
        ClientSessionState.initializationError(
          message: 'Ошибка запуска поиска: $e',
        ),
      );
    }
  }

  Future<void> _onConnectToDevice(Emitter<ClientSessionState> emitter) async {
    try {
      emitter(const ClientSessionState.remoteConfirmationPending());
      await _session.connectToDevice(_viewState.selectedDevice!);
    } catch (e) {
      emitter(
        ClientSessionState.initializationError(
          message: 'Ошибка подключения: $e',
        ),
      );
    }
  }

  Future<void> _onDeviceSelected(
    ClientSessionEventOnDeviceSelected event,
    Emitter<ClientSessionState> emitter,
  ) async {
    final selectedDevice = event.device;
    _viewState = _viewState.copyWith(
      selectedDevice: selectedDevice.id == _viewState.selectedDevice?.id
          ? null
          : selectedDevice,
    );
    emitter(_viewState);
  }

  Future<void> _onInvitationAccepted(
    Emitter<ClientSessionState> emitter,
  ) async {
    emitter(const ClientSessionState.invitationAccepted());
  }

  Future<void> _onInvitationRejected(
    Emitter<ClientSessionState> emitter,
  ) async {
    emitter(const ClientSessionState.invitationRejected());
  }
}
