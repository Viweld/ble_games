import 'package:ble_peer_session/ble_peer_session.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/env.dart';
import '../data/data_providers/cached_data_provider.dart';
import '../data/data_providers/cached_data_provider_impl.dart';
import '../data/repositories/device_repository_impl.dart';
import '../data/repositories/user_repository_impl.dart';
import '../domain/repositories/device_repository.dart';
import '../domain/repositories/user_repository.dart';
import '../services/app_logger_impl.dart';
import 'builders.dep_gen.dart';

/// Окружение приложения для управления зависимостями
class Environment extends DepGenEnvironment {
  /// Инициализация зависимостей
  Future<Environment> prepare() async {
    final logger = AppLoggerImpl();
    registry<Logger>(logger);

    final sharedPreferencesProvider = CachedDataProviderImpl(
      await SharedPreferences.getInstance(),
    );
    registry<CachedDataProvider>(sharedPreferencesProvider);

    registry<UserRepository>(
      UserRepositoryImpl(cachedDataProvider: sharedPreferencesProvider),
    );

    registry<DeviceRepository>(
      DeviceRepositoryImpl(appName: Env.appName, serviceId: Env.serviceId),
    );

    final bleConfig = BlePeerConfig(
      appName: Env.appName,
      serviceUuid: Env.serviceId,
      characteristicUuid: Env.characteristicId,
      deviceNamePrefix: '',
    );

    final bleModule = BlePeerSessionModule.create(
      config: bleConfig,
      logger: logger,
    );
    registry<BluetoothStateService>(bleModule.bluetoothStateService);
    registry<BluetoothPermissionsService>(
      bleModule.bluetoothPermissionsService,
    );
    registry<TransportSessionClient>(bleModule.transportSessionClient);
    registry<TransportSessionServer>(bleModule.transportSessionServer);
    registry<TransportFacade>(bleModule.transportFacade);

    return this;
  }
}
