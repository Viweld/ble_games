import 'package:batuga/core/domain/transport/i_transport_session_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/data_providers/i_cached_data_provider.dart';
import '../data/data_providers/cached_data_provider.dart';
import '../data/transport/ble/facade/ble_transport_facade.dart';
import '../data/transport/ble/link/ble_link_client.dart';
import '../data/transport/ble/link/ble_link_server.dart';
import '../data/transport/ble/messenger/ble_messenger.dart';
import '../data/transport/ble/session/ble_session_client.dart';
import '../data/transport/ble/session/ble_session_server.dart';
import '../domain/logger/i_logger.dart';
import '../domain/repositories/i_user_repository.dart';
import '../domain/services/i_bluetooth_permissions_service.dart';
import '../domain/services/i_bluetooth_state_service.dart';
import '../data/repositories/user_repository.dart';
import '../domain/transport/i_transport_facade.dart';
import '../domain/transport/i_transport_session_server.dart';
import '../services/app_logger.dart';
import '../services/bluetooth_permissions_service.dart';
import '../services/bluetooth_state_service.dart';
import 'builders.dep_gen.dart';

/// Окружение приложения для управления зависимостями
class Environment extends DepGenEnvironment {
  /// Инициализация зависимостей
  Future<Environment> prepare() async {
    /// ЛОГГЕРЫ
    final logger = AppLogger();
    registry<ILogger>(logger);

    /// ПРОВАЙДЕРЫ ДАННЫХ
    // -------------------------------------------------------------------------
    // Провайдер SharedPreferences
    final sharedPreferencesProvider = CachedDataProvider(
      await SharedPreferences.getInstance(),
    );
    registry<ICachedDataProvider>(sharedPreferencesProvider);

    /// РЕПОЗИТОРИИ
    // -------------------------------------------------------------------------
    // Репозиторий игроков
    final playerRepository = UserRepository(
      cachedDataProvider: sharedPreferencesProvider,
    );
    registry<IUserRepository>(playerRepository);

    /// BLUETOOTH СЕРВИСЫ
    // -------------------------------------------------------------------------
    // Сервис состояния Bluetooth
    final bluetoothStateService = BluetoothStateService();
    registry<IBluetoothStateService>(bluetoothStateService);

    // ------------------------------------------------------------------------
    // Сервис разрешений Bluetooth
    final bluetoothPermissionsService = BluetoothPermissionsService();
    registry<IBluetoothPermissionsService>(bluetoothPermissionsService);

    /// BLUETOOTH ТРАНСПОРТ
    // -------------------------------------------------------------------------
    // Клиентская часть
    final linkClient = BleLinkClient(logger: logger);
    final messengerClient = BleMessenger(connector: linkClient, logger: logger);
    final sessionClient = BleSessionClient(
      link: linkClient,
      messenger: messengerClient,
      logger: logger,
    );
    registry<ITransportSessionClient>(sessionClient);

    // Серверная часть
    final linkServer = BleLinkServer(logger: logger);
    final messengerServer = BleMessenger(connector: linkServer, logger: logger);
    final sessionServer = BleSessionServer(
      link: linkServer,
      messenger: messengerServer,
      logger: logger,
    );
    registry<ITransportSessionServer>(sessionServer);

    // Единый транспортный узел
    final bleTransport = BleTransportFacade(
      transportSessionClient: sessionClient,
      transportSessionServer: sessionServer,
    );
    registry<ITransportFacade>(bleTransport);

    // -------------------------------------------------------------------------
    return this;
  }
}
