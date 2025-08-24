part of 'home_bloc.dart';

/// События главного экрана
@freezed
class HomeEvent with _$HomeEvent {
  /// Запрос инициализации
  const factory HomeEvent.onInitializationRequested() =
      HomeEventOnInitializationRequested;

  /// Начать ожидание присоединения
  const factory HomeEvent.onStartAwaitingConnection() =
      HomeEventOnStartAwaitingConnection;

  /// Начать поиск устройств
  const factory HomeEvent.onStartSearchingDevices() =
      HomeEventOnStartSearchingDevices;

  /// Отмена ожидания
  const factory HomeEvent.onCancelAwaiting() = HomeEventOnCancelAwaiting;

  /// Отмена поиска устройств
  const factory HomeEvent.onCancelSearching() = HomeEventOnCancelSearching;

  /// Подключиться к выбранному устройству
  const factory HomeEvent.onConnectToDevice() = HomeEventOnConnectToDevice;

  /// Ручной рефреш списка устройств
  const factory HomeEvent.onRefreshRequested() = HomeEventOnRefreshRequested;

  /// Выбор игрока
  const factory HomeEvent.onDeviceSelected({required Device device}) =
      HomeEventOnDeviceSelected;

  /// Приглашение игрока
  const factory HomeEvent.onInvite() = HomeEventOnInvite;

  /// Отмена приглашения
  const factory HomeEvent.onCancelInvitation() = HomeEventOnCancelInvitation;

  /// Принятие приглашения
  const factory HomeEvent.onAcceptInvitation() = HomeEventOnAcceptInvitation;

  /// Отклонение приглашения
  const factory HomeEvent.onRejectInvitation() = HomeEventOnRejectInvitation;

  /// Сохранение псевдонима
  const factory HomeEvent.onNicknameSaved({required String nickname}) =
      HomeEventOnNicknameSaved;

  /// Изменился стейт экрана
  const factory HomeEvent.onViewStateChanged() = HomeEventOnViewStateChanged;

  /// Получено приглашение
  const factory HomeEvent.onInvitationReceived({required User invitingUser}) =
      HomeEventOnInvitationReceived;

  /// Приглашение отклонено
  const factory HomeEvent.onInvitationRejected({required User rejectedUser}) =
      HomeEventOnInvitationRejected;

  /// Игра началась
  const factory HomeEvent.onGameStarted({required User opponent}) =
      HomeEventOnGameStarted;
}
