part of 'client_session_bloc.dart';

/// Состояния диалога псевдонима
@freezed
abstract class ClientSessionState with _$ClientSessionState {
  /// Состояние ожидания инициализации
  const factory ClientSessionState.pending() = ClientSessionStatePending;

  /// Состояние построения
  const factory ClientSessionState.view({
    @Default([]) List<Device> devices,
    Device? selectedDevice,
  }) = ClientSessionStateView;

  /// Ошибка
  const factory ClientSessionState.error({String? message}) =
      ClientSessionStateError;

  /// Соединение успешно установлено
  const factory ClientSessionState.connected() = ClientSessionStateConnected;
}
