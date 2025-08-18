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
  const factory HomeState.view({
    required List<Device> devices,
    Device? selectedDevice,
    required bool isFirstLaunch,
    required bool isConnected,
  }) = HomeStateView;

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
