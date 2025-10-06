part of 'searching_devices_bloc.dart';

/// Состояния диалога псевдонима
@freezed
abstract class SearchingDevicesState with _$SearchingDevicesState {
  /// Состояние ожидания инициализации
  const factory SearchingDevicesState.pending() = SearchingDevicesStatePending;

  /// Состояние построения
  const factory SearchingDevicesState.view({
    @Default([]) List<Device> devices,
    Device? selectedDevice,
  }) = SearchingDevicesStateView;

  /// Ошибка
  const factory SearchingDevicesState.error({String? message}) =
      SearchingDevicesStateError;

  /// Соединение успешно установлено
  const factory SearchingDevicesState.connected() =
      SearchingDevicesStateConnected;
}
