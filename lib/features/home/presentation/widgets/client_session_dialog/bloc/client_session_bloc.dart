import 'dart:async';

import 'package:batuga/core/domain/models/peer_endpoint.dart';
import 'package:batuga/core/domain/repositories/i_user_repository.dart';
import 'package:batuga/core/domain/transport/i_transport_session_client.dart';
import 'package:bloc/bloc.dart';
import 'package:dep_gen/dep_gen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/domain/models/device.dart';
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
  }) : _userRepo = userRepo,
       _deviceRepo = deviceRepo,
       _session = session,
       super(const ClientSessionState.pending()) {
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

        _ => throw UnimplementedError('Unhandled event: $event'),
      },
    );

    _discoveredDevicesSubscription = _session.discoveredDevicesStream.listen(
      _discoveredDevicesListener,
    );

    add(const ClientSessionEvent.onInitializationRequested());
  }

  final IUserRepository _userRepo;
  final IDeviceRepository _deviceRepo;
  final ITransportSessionClient _session;
  late final StreamSubscription<List<Device>> _discoveredDevicesSubscription;

  late ClientSessionStateView _viewState;

  @override
  Future<void> close() async {
    await _discoveredDevicesSubscription.cancel();
    await _session.stopDiscovery();
    return super.close();
  }

  /// Обновление списка найденных устройств
  void _discoveredDevicesListener(List<Device> devices) {
    if (isClosed) return;
    _viewState = _viewState.copyWith(devices: devices);
    add(const ClientSessionEvent.onViewStateChanged());
  }

  /// Обработчик запроса на инициализацию
  Future<void> _onInitializationRequested(
    ClientSessionEventOnInitializationRequested event,
    Emitter<ClientSessionState> emitter,
  ) async {
    try {
      _viewState = const ClientSessionState.view() as ClientSessionStateView;
      final user = await _userRepo.getCurrentUser();
      // TODO(Vadim): надо перетащить проверку пользователя на предыдущий этап (перед входом в этот экран)
      if (user == null) return;
      final device = await _deviceRepo.getDevice();
      await _session.startDiscovery(
        localPeer: PeerEndpoint(user: user, device: device),
      );
    } catch (e) {
      emitter(ClientSessionState.error(message: 'Ошибка запуска поиска: $e'));
    }
  }

  /// Обработчик подключения к устройству
  Future<void> _onConnectToDevice(Emitter<ClientSessionState> emitter) async {
    try {
      if (_viewState.selectedDevice == null) {
        emitter(
          const ClientSessionState.error(
            message: 'Не выбрано устройство для подключения',
          ),
        );
        return;
      }
      await _session.connectToDevice(_viewState.selectedDevice!);
      // TODO(Vadim): Возможно, стоит здесь отправлять приглашение
      // TODO(Vadim): Тут переход в список игр
    } catch (e) {
      emitter(ClientSessionState.error(message: 'Ошибка подключения: $e'));
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
}
