part of 'searching_devices_bloc.dart';

/// Состояния диалога псевдонима
@freezed
abstract class SearchingDevicesState with _$SearchingDevicesState {
  /// Состояние построения
  const factory SearchingDevicesState.view({
    required List<Device> devices,
    Device? selectedDevice,
  }) = SearchingDevicesStateView;

  /// Соединение успешно установлено
  const factory SearchingDevicesState.connected() =
      SearchingDevicesStateConnected;

  /// Ошибка соединения
  const factory SearchingDevicesState.error({String? message}) =
      SearchingDevicesStateError;
}
