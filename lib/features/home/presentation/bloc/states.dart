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
    required List<Player> players,
    Player? selectedPlayer,
    required bool isFirstLaunch,
  }) = HomeStateView;

  /// Ожидание ответа на приглашение
  const factory HomeState.invitationPending({required Player invitedPlayer}) =
      HomeStateInvitationPending;

  /// Получено приглашение
  const factory HomeState.invitationReceived({required Player invitingPlayer}) =
      HomeStateInvitationReceived;

  /// Приглашение отклонено
  const factory HomeState.invitationRejected({required Player rejectedPlayer}) =
      HomeStateInvitationRejected;

  /// Игра началась
  const factory HomeState.gameStarted({required Player opponent}) =
      HomeStateGameStarted;
}
