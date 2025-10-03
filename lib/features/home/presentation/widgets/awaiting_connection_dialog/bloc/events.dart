part of 'awaiting_connection_bloc.dart';

/// События диалога псевдонима
@freezed
abstract class AwaitingConnectionEvent with _$AwaitingConnectionEvent {
  /// Запрошено включение режима рекламы
  const factory AwaitingConnectionEvent.onAdvertisingRequested() =
      AwaitingConnectionEventOnAdvertisingRequested;
}
