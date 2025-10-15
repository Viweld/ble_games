part of 'client_session_bloc.dart';

/// Состояния диалога псевдонима
@freezed
abstract class ClientSessionState with _$ClientSessionState {
  /// Состояние ожидания инициализации
  const factory ClientSessionState.initializationPending() =
      ClientSessionStateInitializationPending;

  /// Состояние построения
  const factory ClientSessionState.view({
    @Default([]) List<Device> devices,
    Device? selectedDevice,
  }) = ClientSessionStateView;

  /// Ошибка
  const factory ClientSessionState.initializationError({String? message}) =
      ClientSessionStateInitializationError;

  /// Состояние ожидания принятия приглашения
  const factory ClientSessionState.remoteConfirmationPending() =
      ClientSessionStateRemoteConfirmationPending;

  /// Сервер принял приглашение
  const factory ClientSessionState.invitationAccepted() =
      ClientSessionStateInvitationAccepted;

  /// Сервер отклонил приглашение
  const factory ClientSessionState.invitationRejected() =
      ClientSessionStateInvitationRejected;
}
