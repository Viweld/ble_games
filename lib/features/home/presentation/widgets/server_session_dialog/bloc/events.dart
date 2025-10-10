part of 'server_session_bloc.dart';

/// События диалога псевдонима
@freezed
abstract class ServerSessionEvent with _$ServerSessionEvent {
  /// Запрошено включение режима рекламы
  const factory ServerSessionEvent.onInitializationRequested() =
      ServerSessionEventOnInitializationRequested;
}
