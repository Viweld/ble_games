part of 'home_bloc.dart';

/// События главного экрана
@freezed
abstract class HomeEvent with _$HomeEvent {
  /// Запрос инициализации
  const factory HomeEvent.onInitializationRequested() =
      HomeEventOnInitializationRequested;

  /// Нажата кнопка ожидать подключения (роль сервера)
  const factory HomeEvent.onStartSeverSessionTapped() =
      HomeEventOnStartSeverSessionTapped;

  /// Нажата кнопка найти и подключиться (роль клиента)
  const factory HomeEvent.onStartClientSessionTapped() =
      HomeEventOnStartClientSessionTapped;

  /// Соединение установлено
  const factory HomeEvent.onTransportConnected() =
      HomeEventOnTransportConnected;
}
