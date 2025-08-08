part of 'nickname_bloc.dart';

/// События диалога псевдонима
@freezed
class NicknameEvent with _$NicknameEvent {
  /// Изменение псевдонима
  const factory NicknameEvent.onNicknameChanged({required String nickname}) =
      NicknameEventOnNicknameChanged;

  /// Сохранение псевдонима
  const factory NicknameEvent.onSaveNickname({required String nickname}) =
      NicknameEventOnSaveNickname;
}
