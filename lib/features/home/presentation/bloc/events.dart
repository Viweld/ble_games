part of 'home_bloc.dart';

/// События главного экрана
@freezed
class HomeEvent with _$HomeEvent {
  /// Запрос инициализации
  const factory HomeEvent.onInitializationRequested() =
      HomeEventOnInitializationRequested;

  /// Выбор игрока
  const factory HomeEvent.onPlayerSelected({required Player player}) =
      HomeEventOnPlayerSelected;

  /// Приглашение игрока
  const factory HomeEvent.onInvitePlayer({required Player player}) =
      HomeEventOnInvitePlayer;

  /// Отмена приглашения
  const factory HomeEvent.onCancelInvitation() = HomeEventOnCancelInvitation;

  /// Принятие приглашения
  const factory HomeEvent.onAcceptInvitation() = HomeEventOnAcceptInvitation;

  /// Отклонение приглашения
  const factory HomeEvent.onRejectInvitation() = HomeEventOnRejectInvitation;

  /// Сохранение псевдонима
  const factory HomeEvent.onNicknameSaved({required String nickname}) =
      HomeEventOnNicknameSaved;
}
