import 'package:bloc/bloc.dart';
import 'package:dep_gen/dep_gen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/repositories/i_user_repository.dart';
import '../../../../core/repositories/i_bluetooth_repository.dart';
import '../../../../core/constants/app_constants.dart';

part 'events.dart';
part 'states.dart';
part 'splash_bloc.freezed.dart';

/// BLoC для сплэш-скрина
@DepGen()
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc({@DepArg() required IBluetoothRepository bluetoothRepository})
    : _bluetoothRepository = bluetoothRepository,
      super(const SplashState.initializationPending()) {
    on<SplashEvent>(
      (event, emit) => switch (event) {
        SplashEventOnInitializationRequested() => _onInitializationRequested(
          emit,
        ),
        _ => throw UnimplementedError('Unhandled event: $event'),
      },
    );

    add(const SplashEvent.onInitializationRequested());
  }

  final IBluetoothRepository _bluetoothRepository;

  /// Обработчик запроса инициализации
  Future<void> _onInitializationRequested(Emitter<SplashState> emitter) async {
    try {
      // Инициализация Bluetooth
      await _bluetoothRepository.initialize();

      // Задержка для показа сплэш-скрина
      await Future.delayed(Duration(milliseconds: AppConstants.splashDelayMs));

      emitter(const SplashState.view());
    } catch (e) {
      emitter(SplashState.initializationError(e.toString()));
    }
  }
}
