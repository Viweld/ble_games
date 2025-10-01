part of 'splash_bloc.dart';

/// События сплэш-скрина
@freezed
abstract class SplashEvent with _$SplashEvent {
  /// Запрос инициализации
  const factory SplashEvent.onInitializationRequested() =
      SplashEventOnInitializationRequested;
}
