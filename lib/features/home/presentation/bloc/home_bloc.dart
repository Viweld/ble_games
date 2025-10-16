import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dep_gen/dep_gen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/models/user.dart';
import '../../../../core/domain/repositories/i_user_repository.dart';
import '../../../../core/domain/transport/i_transport_facade.dart';
import '../../../../core/domain/transport/models/transport_session_state.dart';

part 'events.dart';

part 'states.dart';

part 'home_bloc.freezed.dart';

/// Роли способа подключения
enum StartAs {
  /// Роль клиента
  client,

  /// Роль сервера
  server,
}

/// BLoC для главного экрана
@DepGen()
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    @DepArg() required IUserRepository userRepo,
    @DepArg() required ITransportFacade transport,
  }) : _userRepo = userRepo,
       _transport = transport,
       super(const HomeState.initializationPending()) {
    on<HomeEvent>(
      (event, emitter) => switch (event) {
        HomeEventOnInitializationRequested() => _onInitializationRequested(
          emitter,
        ),
        HomeEventOnStartSeverSessionTapped() => _onStartSeverSessionTapped(
          emitter,
        ),
        HomeEventOnStartClientSessionTapped() => _onStartClientSessionTapped(
          emitter,
        ),
        HomeEventOnTransportConnected() => _onTransportConnected(emitter),
        _ => throw UnimplementedError('Unhandled event: $event'),
      },
    );

    _connectionStateSubscription = _transport.connectionStateStream.listen(
      _connectionStateStreamListener,
    );
    add(const HomeEvent.onInitializationRequested());
  }

  final IUserRepository _userRepo;
  final ITransportFacade _transport;

  late final StreamSubscription<TransportSessionState>
  _connectionStateSubscription;

  User? _currentUser;

  @override
  Future<void> close() async {
    await _connectionStateSubscription.cancel();
    await _transport.dispose();
    return super.close();
  }

  /// Обработка смены состояний
  void _connectionStateStreamListener(TransportSessionState connectionState) {
    if (isClosed) return;
    if (connectionState is! TransportSessionConnected) return;
    add(const HomeEvent.onTransportConnected());
  }

  /// Обработчик запроса инициализации
  Future<void> _onInitializationRequested(Emitter<HomeState> emitter) async {
    try {
      _currentUser = await _userRepo.getCurrentUser();
      emitter(const HomeState.view());
    } catch (e) {
      emitter(HomeState.initializationError(message: e.toString()));
    }
  }

  /// Обработчик события "соединение установлено"
  Future<void> _onTransportConnected(Emitter<HomeState> emitter) async {
    emitter(const HomeState.connected());
  }

  /// Обработчик запроса инициализации
  Future<void> _onStartSeverSessionTapped(Emitter<HomeState> emitter) async {
    try {
      _currentUser = await _userRepo.getCurrentUser();
      if (_currentUser == null) {
        emitter(const HomeState.nickNameRequired(role: StartAs.server));
      } else {
        emitter(const HomeState.startAsServer());
        emitter(const HomeState.view());
      }
    } catch (e) {
      emitter(HomeState.initializationError(message: e.toString()));
    }
  }

  /// Обработчик запроса инициализации
  Future<void> _onStartClientSessionTapped(Emitter<HomeState> emitter) async {
    try {
      _currentUser = await _userRepo.getCurrentUser();
      if (_currentUser == null) {
        emitter(const HomeState.nickNameRequired(role: StartAs.client));
      } else {
        emitter(const HomeState.startAsClient());
        emitter(const HomeState.view());
      }
    } catch (e) {
      emitter(HomeState.initializationError(message: e.toString()));
    }
  }
}
