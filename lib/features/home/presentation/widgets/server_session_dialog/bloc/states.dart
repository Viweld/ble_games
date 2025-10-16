part of 'server_session_bloc.dart';

/// Состояния диалога псевдонима
@freezed
abstract class ServerSessionState with _$ServerSessionState {
  /// Состояние ожидания приглашения
  const factory ServerSessionState.invitationPending() =
      ServerSessionStateInvitationPending;

  /// Состояние ожидания решения пользователя
  const factory ServerSessionState.userDecision({
    required User remoteUser,
    required Device remoteDevice,
  }) = ServerSessionStateUserDecision;

  /// Разрешено закрыть диалог
  const factory ServerSessionState.closeDialog() =
      ServerSessionStateCloseDialog;

  /// Ошибка соединения
  const factory ServerSessionState.error({String? message}) =
      ServerSessionStateError;
}
