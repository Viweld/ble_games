part of 'searching_devices_bloc.dart';

/// События диалога псевдонима
@freezed
abstract class SearchingDevicesEvent with _$SearchingDevicesEvent {
  /// Изменился стейт экрана
  const factory SearchingDevicesEvent.onViewStateChanged() =
      SearchingDevicesEventOnViewStateChanged;

  /// Запрошено включение режима поиска
  const factory SearchingDevicesEvent.onInitializationRequested() =
      SearchingDevicesEventOnInitializationRequested;

  /// Подключиться к выбранному устройству
  const factory SearchingDevicesEvent.onConnectToDevice() =
      SearchingDevicesEventOnConnectToDevice;

  /// Ручной рефреш списка устройств
  const factory SearchingDevicesEvent.onRefreshRequested() =
      SearchingDevicesEventOnRefreshRequested;

  /// Выбор игрока
  const factory SearchingDevicesEvent.onDeviceSelected({
    required Device device,
  }) = SearchingDevicesEventOnDeviceSelected;
}
