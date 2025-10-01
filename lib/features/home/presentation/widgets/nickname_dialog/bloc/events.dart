part of 'nickname_bloc.dart';

/// События диалога псевдонима
@freezed
abstract class NicknameEvent with _$NicknameEvent {
  /// Изменение псевдонима
  const factory NicknameEvent.onNicknameChanged({required String nick}) =
      NicknameEventOnNicknameChanged;

  /// Сохранение псевдонима
  const factory NicknameEvent.onSaveNickname({required String name}) =
      NicknameEventOnSaveNickname;
}
