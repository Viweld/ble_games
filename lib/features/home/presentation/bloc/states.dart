part of 'home_bloc.dart';

/// Состояния главного экрана
@freezed
class HomeState with _$HomeState {
  /// Состояние инициализации
  const factory HomeState.initializationPending() =
      HomeStateInitializationPending;

  /// Ошибка инициализации
  const factory HomeState.initializationError({required String message}) =
      HomeStateInitializationError;

  /// Основное состояние
  const factory HomeState.view() = HomeStateView;

  /// Режим ожидания подключения (реклама)
  const factory HomeState.awaitingConnection() = HomeStateAwaitingConnection;

  /// Режим поиска устройств
  const factory HomeState.searchingDevices({
    required List<Device> devices,
    Device? selectedDevice,
  }) = HomeStateSearchingDevices;

  /// Ожидание ответа на приглашение
  const factory HomeState.invitationPending({required Device invitedDevice}) =
      HomeStateInvitationPending;

  /// Получено приглашение
  const factory HomeState.invitationReceived({required User invitingUser}) =
      HomeStateInvitationReceived;

  /// Приглашение отклонено
  const factory HomeState.invitationRejected({required User rejectedUser}) =
      HomeStateInvitationRejected;

  /// Игра началась
  const factory HomeState.gameStarted({
    required User opponent,
    required PlayerType myPlayerType,
  }) = HomeStateGameStarted;
}
