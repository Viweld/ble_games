part of 'nickname_bloc.dart';

/// Состояния диалога псевдонима
@freezed
abstract class NicknameState with _$NicknameState {
  /// Начальное состояние
  const factory NicknameState.initial() = NicknameStateInitial;

  /// Псевдоним сохранен
  const factory NicknameState.nicknameSaved() = NicknameStateNicknameSaved;

  /// Ошибка
  const factory NicknameState.error({required String message}) =
      NicknameStateError;
}
