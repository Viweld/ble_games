part of 'splash_bloc.dart';

/// События сплэш-скрина
@freezed
class SplashEvent with _$SplashEvent {
  /// Запрос инициализации
  const factory SplashEvent.onInitializationRequested() =
      SplashEventOnInitializationRequested;
}
