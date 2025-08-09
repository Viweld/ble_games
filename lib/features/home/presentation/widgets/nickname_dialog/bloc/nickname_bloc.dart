import 'package:bloc/bloc.dart';
import 'package:dep_gen/dep_gen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/repositories/i_user_repository.dart';

part 'events.dart';

part 'states.dart';

part 'nickname_bloc.freezed.dart';

/// BLoC для диалога псевдонима
@DepGen()
class NicknameBloc extends Bloc<NicknameEvent, NicknameState> {
  NicknameBloc({@DepArg() required IUserRepository playerRepository})
    : _playerRepository = playerRepository,
      super(const NicknameState.initial()) {
    on<NicknameEvent>(
      (event, emit) => switch (event) {
        NicknameEventOnNicknameChanged() => _onNicknameChanged(event, emit),
        NicknameEventOnSaveNickname() => _onSaveNickname(event, emit),
        _ => throw UnimplementedError('Unhandled event: $event'),
      },
    );
  }

  final IUserRepository _playerRepository;

  /// Обработчик изменения псевдонима
  Future<void> _onNicknameChanged(
    NicknameEventOnNicknameChanged event,
    Emitter<NicknameState> emit,
  ) async {
    // В данном случае просто игнорируем изменение
    // Можно добавить валидацию в реальном времени
  }

  /// Обработчик сохранения псевдонима
  Future<void> _onSaveNickname(
    NicknameEventOnSaveNickname event,
    Emitter<NicknameState> emit,
  ) async {
    try {
      // Здесь должна быть логика создания и сохранения игрока
      // Пока просто эмитим успешное состояние
      emit(const NicknameState.nicknameSaved());
    } catch (e) {
      emit(NicknameState.error(message: e.toString()));
    }
  }
}
