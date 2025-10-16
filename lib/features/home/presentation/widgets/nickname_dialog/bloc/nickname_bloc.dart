import 'package:batuga/core/domain/repositories/i_user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dep_gen/dep_gen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/domain/models/user.dart';

part 'events.dart';

part 'states.dart';

part 'nickname_bloc.freezed.dart';

enum NickNameValidationState { empty, tooLong, wrongFormat }

/// BLoC для диалога псевдонима
@DepGen()
class NicknameBloc extends Bloc<NicknameEvent, NicknameState> {
  NicknameBloc({@DepArg() required IUserRepository userRepo})
    : _userRepo = userRepo,
      super(const NicknameState.view()) {
    on<NicknameEvent>(
      (event, emit) => switch (event) {
        NicknameEventOnNicknameChanged() => _onNicknameChanged(event, emit),
        NicknameEventOnSaveNickname() => _onSaveNickname(event, emit),
        _ => throw UnimplementedError('Unhandled event: $event'),
      },
    );

    _stateView = super.state as NicknameStateView;
  }

  final IUserRepository _userRepo;
  late NicknameStateView _stateView;

  /// Обработчик изменения псевдонима
  Future<void> _onNicknameChanged(
    NicknameEventOnNicknameChanged event,
    Emitter<NicknameState> emitter,
  ) async {
    final nickName = event.nick.trim();
    _stateView = _stateView.copyWith(nickName: nickName);
    if (nickName.isEmpty) {
      _stateView = _stateView.copyWith(
        nickNameValidationState: NickNameValidationState.empty,
        isSaveButtonEnabled: false,
      );
    } else if (nickName.length > 20) {
      _stateView = _stateView.copyWith(
        nickNameValidationState: NickNameValidationState.tooLong,
        isSaveButtonEnabled: false,
      );
    } else if (nickName.contains(' ')) {
      _stateView = _stateView.copyWith(
        nickNameValidationState: NickNameValidationState.wrongFormat,
        isSaveButtonEnabled: false,
      );
    } else {
      _stateView = _stateView.copyWith(
        nickNameValidationState: null,
        isSaveButtonEnabled: true,
      );
    }
    emitter(_stateView);
  }

  /// Обработчик сохранения пользователя
  Future<void> _onSaveNickname(
    NicknameEventOnSaveNickname event,
    Emitter<NicknameState> emitter,
  ) async {
    try {
      await _userRepo.saveCurrentUser(User.fromName(_stateView.nickName));
      emitter(const NicknameState.nicknameSaved());
    } catch (e) {
      emitter(NicknameState.error(message: e.toString()));
    }
  }
}
