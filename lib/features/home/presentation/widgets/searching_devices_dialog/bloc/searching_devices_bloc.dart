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
       super(SearchingDevicesState.view(devices: [])) {
    on<SearchingDevicesEvent>(
      (event, emitter) => switch (event) {
        SearchingDevicesEventOnViewStateChanged() => _onViewStateChanged(
          emitter,
        ),
        SearchingDevicesEventOnSearchingRequested() => _onSearchingRequested(
          event,
          emitter,
        ),
        SearchingDevicesEventOnConnectToDevice() => _onConnectToDevice(emitter),
        SearchingDevicesEventOnDeviceSelected() => _onDeviceSelected(
          event,
          emitter,
        ),

        _ => throw UnimplementedError('Unhandled event: $event'),
      },
    );

    _discoveredDevicesSubscription = _bluetoothRepository.discoveredDevices
        .listen(_updateDiscoveredDevices);

    add(const SearchingDevicesEvent.onSearchingRequested());
  }

  final IBluetoothManager _bluetoothRepository;
  late final StreamSubscription<List<Device>> _discoveredDevicesSubscription;

  List<Device> _devices = [];
  Device? _selectedDevice;

  @override
  close() {
    _discoveredDevicesSubscription.cancel();
    unawaited(_bluetoothRepository.stopDiscovery());
    return super.close();
  }

  /// Обновление списка найденных устройств
  void _updateDiscoveredDevices(List<Device> devices) {
    if (isClosed) return;
    _devices = devices;
    final currentState = state;

    if (currentState is! SearchingDevicesStateView) return;
    add(const SearchingDevicesEvent.onViewStateChanged());
  }

  /// Обработчик начала поиска устройств
  Future<void> _onSearchingRequested(
    SearchingDevicesEventOnSearchingRequested event,
    Emitter<SearchingDevicesState> emitter,
  ) async {
    try {
      _devices = [];
      _selectedDevice = null;
      await _bluetoothRepository.startDiscovery();
      emitter(
        SearchingDevicesState.view(
          devices: _devices,
          selectedDevice: _selectedDevice,
        ),
      );
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
      if (_selectedDevice == null) {
        emitter(
          const SearchingDevicesState.error(
            message: 'Не выбрано устройство для подключения',
          ),
        );
        return;
      }
      await _bluetoothRepository.connectToDevice(_selectedDevice!);
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
    _selectedDevice = event.device;
    final currentState = state;
    if (currentState is! SearchingDevicesStateView) return;
    emitter(currentState.copyWith(selectedDevice: _selectedDevice));
  }

  /// Обработчик изменения состояния представления
  void _onViewStateChanged(Emitter<SearchingDevicesState> emitter) {
    final currentState = state;
    if (currentState is! SearchingDevicesStateView) return;
    emitter(
      currentState.copyWith(devices: _devices, selectedDevice: _selectedDevice),
    );
  }
}
