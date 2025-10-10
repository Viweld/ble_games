part of 'server_session_bloc.dart';

/// Состояния диалога псевдонима
@freezed
abstract class ServerSessionState with _$ServerSessionState {
  /// Состояние построения
  const factory ServerSessionState.view() = ServerSessionStateView;

  /// Соединение успешно установлено
  const factory ServerSessionState.connected() = ServerSessionStateConnected;

  /// Ошибка соединения
  const factory ServerSessionState.error({String? message}) =
      ServerSessionStateError;
}
