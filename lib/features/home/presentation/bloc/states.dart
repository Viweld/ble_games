part of 'home_bloc.dart';

/// Состояние BLoC главного экрана
@freezed
abstract class HomeState with _$HomeState {
  /// Состояние инициализации
  const factory HomeState.initializationPending() =
      HomeStateInitializationPending;

  /// Ошибка инициализации
  const factory HomeState.initializationError({required String message}) =
      HomeStateInitializationError;

  /// Основное состояние
  const factory HomeState.view() = HomeStateView;

  /// Начать соединение как сервер
  const factory HomeState.startAsServer() = HomeStateStartAsServer;

  /// Начать соединение как клиент
  const factory HomeState.startAsClient() = HomeStateStartAsClient;

  /// Требуется создать псевдоним
  const factory HomeState.nickNameRequired({required StartAs role}) =
      HomeStateNickNameRequired;

  /// Успешное соединение
  const factory HomeState.connected() = HomeStateConnected;
}
