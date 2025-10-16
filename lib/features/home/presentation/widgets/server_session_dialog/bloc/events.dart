part of 'server_session_bloc.dart';

/// События диалога псевдонима
@freezed
abstract class ServerSessionEvent with _$ServerSessionEvent {
  /// Запрошено включение режима рекламы
  const factory ServerSessionEvent.onInitializationRequested() =
      ServerSessionEventOnInitializationRequested;

  /// Поступило приглашение на соединение
  const factory ServerSessionEvent.onInvitationReceived({
    required User remoteUser,
    required Device remoteDevice,
  }) = ServerSessionEventOnInvitationReceived;

  /// Пользователь принял приглашение
  const factory ServerSessionEvent.onAcceptTapped() =
      ServerSessionEventOnAcceptTapped;

  /// Пользователь отклонил приглашение
  const factory ServerSessionEvent.onRejectTapped() =
      ServerSessionEventOnRejectTapped;
}
