import 'package:bloc/bloc.dart';
import 'package:dep_gen/dep_gen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/game.dart';

part 'events.dart';
part 'states.dart';
part 'games_list_bloc.freezed.dart';

/// BLoC для экрана списка игр
@DepGen()
class GamesListBloc extends Bloc<GamesListEvent, GamesListState> {
  /// Создает экземпляр BLoC для списка игр
  GamesListBloc() : super(const GamesListState.initializationPending()) {
    on<GamesListEvent>(
      (event, emit) => switch (event) {
        GamesListEventOnInitializationRequested() => _onInitializationRequested(
          emit,
        ),
        GamesListEventOnGameSelected() => _onGameSelected(event, emit),
        GamesListEventOnGameStart() => _onGameStart(emit),
        GamesListEventOnBackPressed() => _onBackPressed(emit),
        _ => throw UnsupportedError('Неподдерживаемое событие: $event'),
      },
    );

    add(const GamesListEvent.onInitializationRequested());
  }

  List<Game> _games = [];
  Game? _selectedGame;
  GamesListStateView? _viewState;

  /// Обработчик запроса инициализации
  Future<void> _onInitializationRequested(Emitter<GamesListState> emit) async {
    try {
      // Инициализируем список доступных игр
      _games = [
        const Game(
          id: 'tictactoe',
          name: 'Крестики-нолики',
          description: 'Классическая игра крестики-нолики для двух игроков',
          routeName: '/tictactoe',
        ),
      ];

      _viewState = GamesListStateView(
        games: _games,
        selectedGame: _selectedGame,
      );
      emit(_viewState!);
    } catch (e) {
      emit(GamesListState.initializationError(message: e.toString()));
    }
  }

  /// Обработчик выбора игры
  Future<void> _onGameSelected(
    GamesListEventOnGameSelected event,
    Emitter<GamesListState> emit,
  ) async {
    _selectedGame = event.game;

    if (_viewState != null) {
      _viewState = _viewState!.copyWith(selectedGame: _selectedGame);
      emit(_viewState!);
    }
  }

  /// Обработчик запуска игры
  Future<void> _onGameStart(Emitter<GamesListState> emit) async {
    if (_selectedGame != null) {
      emit(GamesListState.gameStarting(game: _selectedGame!));
    }
  }

  /// Обработчик возврата назад
  Future<void> _onBackPressed(Emitter<GamesListState> emit) async {
    // Логика возврата к предыдущему экрану будет обработана в UI
  }
}
