import 'dart:async';

import 'package:batuga/core/domain/transport/bluetooth/i_transport_facade.dart';
import 'package:bloc/bloc.dart';
import 'package:dep_gen/dep_gen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/models/device.dart';
import '../../../../core/domain/models/messages.dart';
import '../../../../core/domain/models/user.dart';
import '../../../../core/domain/repositories/i_user_repository.dart';
import '../../../tictactoe/domain/models/enums/player_type.dart';

part 'events.dart';

part 'states.dart';

part 'home_bloc.freezed.dart';

/// BLoC для главного экрана
@DepGen()
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    @DepArg() required IUserRepository playerRepository,
    @DepArg() required ITransportFacade gateway,
  }) : _playerRepository = playerRepository,
       _gateway = gateway,
       super(const HomeState.initializationPending()) {
    on<HomeEvent>(
      (event, emitter) => switch (event) {
        HomeEventOnInitializationRequested() => _onInitializationRequested(
          emitter,
        ),
        HomeEventOnNicknameSaved() => _onNicknameSaved(event, emitter),
        HomeEventOnInvitationReceived() => _onInvitationReceived(
          event,
          emitter,
        ),
        HomeEventOnInvitationRejected() => _onInvitationRejected(
          event,
          emitter,
        ),
        HomeEventOnConnected() => _onConnected(event, emitter),
        HomeEventOnAcceptInvitation() => _onAcceptInvitation(emitter),
        HomeEventOnRejectInvitation() => _onRejectInvitation(emitter),
        _ => throw UnimplementedError('Unhandled event: $event'),
      },
    );

    _incomingDataSubscription = _gateway.connectionManager.messagesStream
        .listen(_handleIncomingMessage);
    add(const HomeEvent.onInitializationRequested());
  }

  final IUserRepository _playerRepository;
  final ITransportFacade _gateway;

  late final StreamSubscription<Message> _incomingDataSubscription;

  User? _currentUser;

  @override
  Future<void> close() {
    _incomingDataSubscription.cancel();
    _gateway.dispose();
    return super.close();
  }

  /// Обработчик запроса инициализации
  Future<void> _onInitializationRequested(Emitter<HomeState> emitter) async {
    try {
      _currentUser = await _playerRepository.getCurrentUser();
      emitter(const HomeState.view());
    } catch (e) {
      emitter(HomeState.initializationError(message: e.toString()));
    }
  }

  /// Обработчик сохранения псевдонима
  Future<void> _onNicknameSaved(
    HomeEventOnNicknameSaved event,
    Emitter<HomeState> emitter,
  ) async {
    try {
      final user = User(id: 'local_user', name: event.nickname);
      await _playerRepository.saveCurrentUser(user);
      _currentUser = user;
      await _playerRepository.setFirstLaunch(false);
      emitter(const HomeState.view());
    } catch (e) {
      emitter(
        HomeState.initializationError(
          message: 'Ошибка сохранения псевдонима: $e',
        ),
      );
    }
  }

  /// Обработчик получения приглашения
  void _onInvitationReceived(
    HomeEventOnInvitationReceived event,
    Emitter<HomeState> emitter,
  ) {
    emitter(HomeState.invitationReceived(invitingUser: event.invitingUser));
  }

  /// Обработчик отклонения приглашения
  void _onInvitationRejected(
    HomeEventOnInvitationRejected event,
    Emitter<HomeState> emitter,
  ) {
    emitter(HomeState.invitationRejected(rejectedUser: event.rejectedUser));
  }

  /// Обработчик начала игры
  void _onConnected(HomeEventOnConnected event, Emitter<HomeState> emitter) {
    emitter(
      HomeState.connected(opponent: event.opponent, myPlayerType: PlayerType.x),
    );
  }

  /// Обработчик принятия приглашения
  Future<void> _onAcceptInvitation(Emitter<HomeState> emitter) async {
    try {
      final currentUser =
          _currentUser ?? User(id: 'temp_user', name: 'Тестовый пользователь');
      // Отправляем сообщение о принятии
      // if (_bluetoothRepository.isConnected) {
      //   final acceptanceMessage = AcceptanceMessage(
      //     device: _bluetoothRepository.connectedDevice!,
      //     user: currentUser,
      //   );
      //   await _bluetoothRepository.sendMessage(acceptanceMessage);
      // }

      // TODO(Vadim): Тут переход в список игр
    } catch (e) {
      emitter(HomeState.connectionError(message: 'Ошибка принятия: $e'));
    }
  }

  /// Обработчик отклонения приглашения
  Future<void> _onRejectInvitation(Emitter<HomeState> emitter) async {
    try {
      final currentUser =
          _currentUser ?? User(id: 'temp_user', name: 'Тестовый пользователь');

      // if (_bluetoothRepository.isConnected) {
      //   final rejectionMessage = RejectionMessage(
      //     device: _bluetoothRepository.connectedDevice!,
      //     user: currentUser,
      //   );
      //   await _bluetoothRepository.sendMessage(rejectionMessage);
      // }
      emitter(const HomeState.view());
    } catch (e) {
      emitter(HomeState.connectionError(message: 'Ошибка отклонения: $e'));
    }
  }

  /// Обработка входящих данных
  void _handleIncomingMessage(Message message) {
    if (isClosed) return;
    // fixme: Добавить обработку других типов сообщений
  }
}
