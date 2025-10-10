import 'package:batuga/core/domain/services/i_bluetooth_state_service.dart';
import 'package:bloc/bloc.dart';
import 'package:dep_gen/dep_gen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/domain/services/i_bluetooth_permissions_service.dart';

part 'events.dart';

part 'states.dart';

part 'splash_bloc.freezed.dart';

/// BLoC для сплэш-скрина
@DepGen()
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc({
    @DepArg() required IBluetoothPermissionsService bluetoothPermissionsService,
    @DepArg() required IBluetoothStateService bluetoothStateService,
  }) : _bluetoothPermissionsService = bluetoothPermissionsService,
       _bluetoothStateService = bluetoothStateService,
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

  final IBluetoothPermissionsService _bluetoothPermissionsService;
  final IBluetoothStateService _bluetoothStateService;

  /// Обработчик запроса инициализации
  Future<void> _onInitializationRequested(Emitter<SplashState> emitter) async {
    try {
      // 1. Проверка и запрос разрешений Bluetooth
      // TODO(Vadim): Позже добавить предупреждения если что-то не так
      await _bluetoothPermissionsService.checkPermissions();

      // 2. Проверка и запрос включения Bluetooth
      // TODO(Vadim): Позже добавить предупреждения если что-то не так
      if (!await _bluetoothStateService.isBluetoothEnabled()) {
        await _bluetoothStateService.enableBluetooth();
      }

      // Задержка для показа сплэш-скрина
      await Future.delayed(
        const Duration(milliseconds: AppConstants.splashDelayMs),
      );

      emitter(const SplashState.view());
    } catch (e) {
      emitter(SplashState.initializationError(e.toString()));
    }
  }
}
