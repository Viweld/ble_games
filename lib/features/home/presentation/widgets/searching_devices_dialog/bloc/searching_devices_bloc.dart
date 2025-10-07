import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dep_gen/dep_gen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/domain/models/device.dart';
import '../../../../../../core/domain/services/bluetooth_manager/i_bluetooth_manager.dart';

part 'events.dart';

part 'states.dart';

part 'searching_devices_bloc.freezed.dart';

/// BLoC для диалога ожидания подключения
@DepGen()
class SearchingDevicesBloc
    extends Bloc<SearchingDevicesEvent, SearchingDevicesState> {
  SearchingDevicesBloc({
    @DepArg() required IBluetoothManager bluetoothRepository,
  }) : _bluetoothRepository = bluetoothRepository,
       super(SearchingDevicesState.pending()) {
    on<SearchingDevicesEvent>(
      (event, emitter) => switch (event) {
        SearchingDevicesEventOnViewStateChanged() => emitter(_viewState),
        SearchingDevicesEventOnInitializationRequested() =>
          _onInitializationRequested(event, emitter),
        SearchingDevicesEventOnConnectToDevice() => _onConnectToDevice(emitter),
        SearchingDevicesEventOnDeviceSelected() => _onDeviceSelected(
          event,
          emitter,
        ),

        _ => throw UnimplementedError('Unhandled event: $event'),
      },
    );

    _discoveredDevicesSubscription = _bluetoothRepository
        .discoveredDevicesStream
        .listen(_discoveredDevicesListener);

    add(const SearchingDevicesEvent.onInitializationRequested());
  }

  final IBluetoothManager _bluetoothRepository;
  late final StreamSubscription<List<Device>> _discoveredDevicesSubscription;

  late SearchingDevicesStateView _viewState;

  @override
  close() {
    _discoveredDevicesSubscription.cancel();
    unawaited(_bluetoothRepository.stopDiscovery());
    return super.close();
  }

  /// Обновление списка найденных устройств
  void _discoveredDevicesListener(List<Device> devices) {
    if (isClosed) return;
    _viewState = _viewState.copyWith(devices: devices);
    add(const SearchingDevicesEvent.onViewStateChanged());
  }

  /// Обработчик запроса на инициализацию
  Future<void> _onInitializationRequested(
    SearchingDevicesEventOnInitializationRequested event,
    Emitter<SearchingDevicesState> emitter,
  ) async {
    try {
      _viewState = SearchingDevicesState.view() as SearchingDevicesStateView;
      await _bluetoothRepository.startDiscovery();
    } catch (e) {
      emitter(
        SearchingDevicesState.error(message: 'Ошибка запуска поиска: $e'),
      );
    }
  }

  /// Обработчик подключения к устройству
  Future<void> _onConnectToDevice(
    Emitter<SearchingDevicesState> emitter,
  ) async {
    try {
      if (_viewState.selectedDevice == null) {
        emitter(
          const SearchingDevicesState.error(
            message: 'Не выбрано устройство для подключения',
          ),
        );
        return;
      }
      await _bluetoothRepository.connectToDevice(_viewState.selectedDevice!);
      // TODO(Vadim): Возможно, стоит здесь отправлять приглашение
      // TODO(Vadim): Тут переход в список игр
    } catch (e) {
      emitter(SearchingDevicesState.error(message: 'Ошибка подключения: $e'));
    }
  }

  /// Обработчик выбора устройства
  Future<void> _onDeviceSelected(
    SearchingDevicesEventOnDeviceSelected event,
    Emitter<SearchingDevicesState> emitter,
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
