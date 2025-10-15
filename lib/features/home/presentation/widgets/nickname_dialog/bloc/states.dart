part of 'nickname_bloc.dart';

/// Состояния диалога псевдонима
@freezed
abstract class NicknameState with _$NicknameState {
  /// Состояние вью
  const factory NicknameState.view({
    @Default('') String nickName,
    NickNameValidationState? nickNameValidationState,
    @Default(false) bool isSaveButtonEnabled,
  }) = NicknameStateView;

  /// Псевдоним сохранен
  const factory NicknameState.nicknameSaved() = NicknameStateNicknameSaved;

  /// Ошибка
  const factory NicknameState.error({required String message}) =
      NicknameStateError;
}
