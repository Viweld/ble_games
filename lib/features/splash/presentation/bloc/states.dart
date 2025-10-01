part of 'splash_bloc.dart';

/// Состояния сплэш-скрина
@freezed
abstract class SplashState with _$SplashState {
  /// Состояние инициализации
  const factory SplashState.initializationPending() =
      SplashStateInitializationPending;

  /// Ошибка инициализации
  const factory SplashState.initializationError(String message) =
      SplashStateInitializationError;

  /// Основное состояние
  const factory SplashState.view() = SplashStateView;
}
