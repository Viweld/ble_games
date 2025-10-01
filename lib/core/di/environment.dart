import 'package:shared_preferences/shared_preferences.dart';

import '../data/data_providers/i_cached_data_provider.dart';
import '../data/data_providers/cached_data_provider.dart';
import '../domain/repositories/i_user_repository.dart';
import '../domain/services/i_bluetooth_service.dart';
import '../repositories/user_repository.dart';
import '../services/bluetooth_service.dart';
import 'builders.dep_gen.dart';

/// Окружение приложения для управления зависимостями
class Environment extends DepGenEnvironment {
  /// Инициализация зависимостей
  Future<Environment> prepare() async {
    /// ПРОВАЙДЕРЫ ДАННЫХ
    /// ------------------------------------------------------------------------
    // Провайдер SharedPreferences
    final ICachedDataProvider sharedPreferencesProvider = CachedDataProvider(
      await SharedPreferences.getInstance(),
    );
    registry<ICachedDataProvider>(sharedPreferencesProvider);

    /// РЕПОЗИТОРИИ
    /// ------------------------------------------------------------------------
    // Репозиторий игроков
    final IUserRepository playerRepository = UserRepository(
      cachedDataProvider: sharedPreferencesProvider,
    );
    registry<IUserRepository>(playerRepository);

    // Репозиторий Bluetooth
    final IBluetoothService bluetoothManager = BluetoothService();
    registry<IBluetoothService>(bluetoothManager);

    /// ------------------------------------------------------------------------
    return this;
  }
}
