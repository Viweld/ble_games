import 'package:shared_preferences/shared_preferences.dart';

import '../data/data_providers/i_cached_data_provider.dart';
import '../data/data_providers/cached_data_provider.dart';
import '../repositories/i_user_repository.dart';
import '../repositories/i_bluetooth_repository.dart';
import '../repositories/user_repository.dart';
import '../repositories/bluetooth_repository.dart';
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
    final IBluetoothRepository bluetoothRepository = BluetoothRepository();
    registry<IBluetoothRepository>(bluetoothRepository);

    /// ------------------------------------------------------------------------
    return this;
  }
}
