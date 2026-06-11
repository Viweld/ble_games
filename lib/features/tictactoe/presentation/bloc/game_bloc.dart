import 'dart:async';

import 'package:ble_peer_session/ble_peer_session.dart';
import 'package:bloc/bloc.dart';
import 'package:dep_gen/dep_gen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/models/user.dart';
import '../../../../core/domain/repositories/user_repository.dart';
import '../../../../core/transport/peer_endpoint_mapper.dart';
import '../../domain/game_peer_message_codec.dart';
import '../../domain/models/enums/game_winner.dart';
import '../../domain/models/enums/player_type.dart';
import '../../domain/models/game_move.dart';
import '../../domain/models/game_position.dart';
import '../../domain/services/game_rules.dart';

part 'events.dart';

part 'states.dart';

part 'game_bloc.freezed.dart';

/// BLoC для игры
@DepGen()
class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc({
    @DepArg() required TransportFacade transport,
    @DepArg() required UserRepository userRepository,
  }) : _transport = transport,
       _userRepository = userRepository,
       super(const GameState.initializationPending()) {
    on<GameEvent>(
      (event, emit) => switch (event) {
        GameEventOnInitializationRequested() => _onInitializationRequested(
          emit,
        ),
        GameEventOnCellTapped() => _onCellTapped(event, emit),
        GameEventOnIncomingMove() => _onIncomingMove(event, emit),
        GameEventOnConnectionLost() => _onConnectionLost(emit),
        GameEventOnRoleAssigned() => _onRoleAssigned(event, emit),
        _ => throw UnimplementedError('Unhandled event: $event'),
      },
    );
    _gameBoard = List.generate(3, (_) => List.filled(3, null));

    _incomingDataSubscription = _transport.messagesStream.listen((message) {
      if (isClosed) return;
      switch (message) {
        case PeerMessage():
          final move = decodeMoveMessage(message);
          if (move != null) {
            add(
              GameEvent.onIncomingMove(
                row: move.position.row,
                column: move.position.column,
                playerType: move.playerType,
              ),
            );
          } else if (isOpponentLeftMessage(message)) {
            add(const GameEvent.onConnectionLost());
          }
        case DisconnectionMessage():
          add(const GameEvent.onConnectionLost());
        default:
          break;
      }
    });

    add(const GameEvent.onInitializationRequested());
  }

  final TransportFacade _transport;
  final UserRepository _userRepository;

  late final StreamSubscription<TransportMessage> _incomingDataSubscription;
  late final List<List<PlayerType?>> _gameBoard;
  PlayerType _currentPlayer = PlayerType.x;
  PlayerType _playerType = PlayerType.x;
  GameWinner _gameWinner = GameWinner.none;
  User? _currentUser;
  GameStateView? _viewState;

  @override
  Future<void> close() async {
    await _incomingDataSubscription.cancel();
    await super.close();
  }

  Future<void> _onInitializationRequested(Emitter<GameState> emit) async {
    try {
      _currentUser = await _userRepository.getCurrentUser();
      _currentPlayer = PlayerType.x;
      _playerType = PlayerType.x;

      _viewState = GameStateView(
        gameBoard: _gameBoard,
        currentPlayer: _currentPlayer,
        playerType: _playerType,
        gameWinner: _gameWinner,
      );
      emit(_viewState!);
    } catch (e) {
      emit(GameState.initializationError(message: e.toString()));
    }
  }

  Future<void> _onCellTapped(
    GameEventOnCellTapped event,
    Emitter<GameState> emit,
  ) async {
    try {
      if (_currentPlayer != _playerType) return;
      if (_gameBoard[event.row][event.column] != null) return;

      _gameBoard[event.row][event.column] = _currentPlayer;
      _gameWinner = GameRules.determineWinner(_gameBoard);

      final sessionState = _transport.transportSession.currentConnectionState;
      if (sessionState is TransportSessionConnected && _currentUser != null) {
        final localDevice = sessionState.localPeer.device;
        await _transport.sendMessage(
          encodeMoveMessage(
            peerEndpoint: buildPeerEndpoint(
              user: _currentUser!,
              device: localDevice,
            ),
            move: GameMove(
              position: GamePosition(row: event.row, column: event.column),
              playerType: _currentPlayer,
            ),
          ),
        );
      }

      if (_viewState != null) {
        _viewState = _viewState!.copyWith(
          gameBoard: _gameBoard,
          gameWinner: _gameWinner,
        );
        emit(_viewState!);
      }

      if (_gameWinner == GameWinner.none) {
        _currentPlayer = _currentPlayer == PlayerType.x
            ? PlayerType.o
            : PlayerType.x;
        if (_viewState != null) {
          _viewState = _viewState!.copyWith(currentPlayer: _currentPlayer);
          emit(_viewState!);
        }
      }
    } catch (e) {
      emit(GameState.initializationError(message: 'Ошибка хода: $e'));
    }
  }

  Future<void> _onIncomingMove(
    GameEventOnIncomingMove event,
    Emitter<GameState> emit,
  ) async {
    _gameBoard[event.row][event.column] = event.playerType;
    _gameWinner = GameRules.determineWinner(_gameBoard);

    if (_viewState != null) {
      _viewState = _viewState!.copyWith(
        gameBoard: _gameBoard,
        gameWinner: _gameWinner,
      );
      emit(_viewState!);
    }

    if (_gameWinner == GameWinner.none) {
      _currentPlayer = _currentPlayer == PlayerType.x
          ? PlayerType.o
          : PlayerType.x;
      if (_viewState != null) {
        _viewState = _viewState!.copyWith(currentPlayer: _currentPlayer);
        emit(_viewState!);
      }
    }
  }

  void _onConnectionLost(Emitter<GameState> emit) {
    emit(const GameState.connectionLost());
  }

  Future<void> _onRoleAssigned(
    GameEventOnRoleAssigned event,
    Emitter<GameState> emit,
  ) async {
    _playerType = event.myPlayerType;
    _currentPlayer = _playerType;
    if (_viewState != null) {
      _viewState = _viewState!.copyWith(
        currentPlayer: _currentPlayer,
        playerType: _playerType,
      );
      emit(_viewState!);
    }
  }
}
