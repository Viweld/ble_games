part of 'client_session_bloc.dart';

/// События диалога псевдонима
@freezed
abstract class ClientSessionEvent with _$ClientSessionEvent {
  /// Изменился стейт экрана
  const factory ClientSessionEvent.onViewStateChanged() =
      ClientSessionEventOnViewStateChanged;

  /// Запрошено включение режима поиска
  const factory ClientSessionEvent.onInitializationRequested() =
      ClientSessionEventOnInitializationRequested;

  /// Подключиться к выбранному устройству
  const factory ClientSessionEvent.onConnectToDevice() =
      ClientSessionEventOnConnectToDevice;

  /// Ручной рефреш списка устройств
  const factory ClientSessionEvent.onRefreshRequested() =
      ClientSessionEventOnRefreshRequested;

  /// Выбор игрока
  const factory ClientSessionEvent.onDeviceSelected({required Device device}) =
      ClientSessionEventOnDeviceSelected;
}
