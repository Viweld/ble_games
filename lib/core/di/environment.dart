import 'package:shared_preferences/shared_preferences.dart';

import '../data/data_providers/i_cached_data_provider.dart';
import '../data/data_providers/cached_data_provider.dart';
import '../domain/logger/i_logger.dart';
import '../domain/repositories/i_user_repository.dart';
import '../domain/services/bluetooth/bluetooth_connection_manager_client.dart';
import '../domain/services/bluetooth/bluetooth_connector_client.dart';
import '../domain/services/bluetooth/bluetooth_connector_server.dart';
import '../domain/services/bluetooth/bluetooth_logger.dart';
import '../domain/services/bluetooth/bluetooth_messenger.dart';
import '../domain/services/bluetooth_manager/i_bluetooth_manager.dart';
import '../domain/services/i_bluetooth_permissions_service.dart';
import '../domain/services/i_bluetooth_state_service.dart';
import '../data/repositories/user_repository.dart';
import '../data/repositories/bluetooth_manager.dart';
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

    /// СЕРВИСЫ
    // -------------------------------------------------------------------------
    // Сервис состояния Bluetooth
    final bluetoothStateService = BluetoothStateService();
    registry<IBluetoothStateService>(bluetoothStateService);

    // ------------------------------------------------------------------------
    // Сервис разрешений Bluetooth
    final bluetoothPermissionsService = BluetoothPermissionsService();
    registry<IBluetoothPermissionsService>(bluetoothPermissionsService);

    // Менеджер Bluetooth
    final bluetoothManager = BluetoothManager();
    registry<IBluetoothManager>(bluetoothManager);

    /// BLUETOOTH
    // -------------------------------------------------------------------------
    // Клиентская часть
    final connectorClient = BluetoothConnectorClient(logger: logger);
    final messengerClient = BluetoothMessenger(
      connector: connectorClient,
      logger: logger,
    );
    final connectionManagerClient = BluetoothConnectionManagerClient(
      connector: connectorClient,
      messenger: messengerClient,
      logger: logger,
    );

    // Серверная часть
    final connectorServer = BluetoothConnectorServer(logger: logger);
    final messengerServer = BluetoothMessenger(
      connector: connectorServer,
      logger: logger,
    );
    final connectionManagerServer = BluetoothConnectionManagerServer(
      connector: connectorServer,
      messenger: messengerServer,
      logger: logger,
    );

    // -------------------------------------------------------------------------
    return this;
  }
}
