import 'dart:async';

import 'package:batuga/core/domain/models/peer_endpoint.dart';
import 'package:batuga/core/domain/repositories/i_user_repository.dart';
import 'package:batuga/core/domain/transport/i_transport_facade.dart';
import 'package:batuga/core/domain/transport/i_transport_session_client.dart';
import 'package:bloc/bloc.dart';
import 'package:dep_gen/dep_gen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/domain/models/device.dart';
import '../../../../../../core/domain/models/messages.dart';
import '../../../../../../core/domain/repositories/i_device_repository.dart';

part 'events.dart';

part 'states.dart';

part 'client_session_bloc.freezed.dart';

/// BLoC для диалога ожидания подключения
@DepGen()
class ClientSessionBloc extends Bloc<ClientSessionEvent, ClientSessionState> {
  ClientSessionBloc({
    @DepArg() required IUserRepository userRepo,
    @DepArg() required IDeviceRepository deviceRepo,
    @DepArg() required ITransportSessionClient session,
    @DepArg() required ITransportFacade transport,
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

  final IUserRepository _userRepo;
  final IDeviceRepository _deviceRepo;
  final ITransportSessionClient _session;
  late final StreamSubscription<List<Device>> _discoveredDevicesSubscription;
  late final StreamSubscription<Message> _messagesStreamSubscription;

  late ClientSessionStateView _viewState;

  @override
  Future<void> close() async {
    await _discoveredDevicesSubscription.cancel();
    await _messagesStreamSubscription.cancel();
    await _session.stopDiscovery();
    return super.close();
  }

  /// Обновление списка найденных устройств
  void _discoveredDevicesListener(List<Device> devices) {
    if (isClosed) return;
    _viewState = _viewState.copyWith(devices: devices);
    add(const ClientSessionEvent.onViewStateChanged());
  }

  void _messagesStreamListener(Message event) {
    if (isClosed) return;
    if (event is AcceptanceMessage) {
      add(const ClientSessionEvent.onInvitationAccepted());
    } else if (event is RejectionMessage) {
      add(const ClientSessionEvent.onInvitationRejected());
    }
  }

  /// Обработчик запроса на инициализацию
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
        localPeer: PeerEndpoint(user: user, device: device),
      );
    } catch (e) {
      emitter(
        ClientSessionState.initializationError(
          message: 'Ошибка запуска поиска: $e',
        ),
      );
    }
  }

  /// Обработчик подключения к устройству
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

  /// Обработчик выбора устройства
  Future<void> _onDeviceSelected(
    ClientSessionEventOnDeviceSelected event,
    Emitter<ClientSessionState> emitter,
  ) async {
    final selectedDevice = event.device;
    selectedDevice.id == _viewState.selectedDevice?.id ? null : selectedDevice;
    _viewState = _viewState.copyWith(
      selectedDevice: selectedDevice.id == _viewState.selectedDevice?.id
          ? null
          : selectedDevice,
    );
    emitter(_viewState);
  }

  /// Обработчик события - "Сервер принял приглашение"
  Future<void> _onInvitationAccepted(
    Emitter<ClientSessionState> emitter,
  ) async {
    emitter(const ClientSessionState.invitationAccepted());
  }

  /// Обработчик события - "Сервер отклонил приглашение"
  Future<void> _onInvitationRejected(
    Emitter<ClientSessionState> emitter,
  ) async {
    emitter(const ClientSessionState.invitationRejected());
  }
}
