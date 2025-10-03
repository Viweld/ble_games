part of 'awaiting_connection_bloc.dart';

/// Состояния диалога псевдонима
@freezed
abstract class AwaitingConnectionState with _$AwaitingConnectionState {
  /// Состояние построения
  const factory AwaitingConnectionState.view() = AwaitingConnectionStateView;

  /// Соединение успешно установлено
  const factory AwaitingConnectionState.connected() =
      AwaitingConnectionStateConnected;

  /// Ошибка соединения
  const factory AwaitingConnectionState.error({String? message}) =
      AwaitingConnectionStateError;
}
