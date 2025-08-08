import 'package:shared_preferences/shared_preferences.dart';

import '../data/data_providers/i_shared_preferences_provider.dart';
import '../data/data_providers/shared_preferences_provider.dart';
import '../repositories/i_player_repository.dart';
import '../repositories/i_bluetooth_repository.dart';
import '../repositories/player_repository.dart';
import '../repositories/bluetooth_repository.dart';
import 'builders.dep_gen.dart';

/// Окружение приложения для управления зависимостями
class Environment extends DepGenEnvironment {
  /// Инициализация зависимостей
  Future<Environment> prepare() async {
    /// ПРОВАЙДЕРЫ ДАННЫХ
    /// ------------------------------------------------------------------------
    // Провайдер SharedPreferences
    final ISharedPreferencesProvider sharedPreferencesProvider =
        SharedPreferencesProvider(await SharedPreferences.getInstance());
    registry<ISharedPreferencesProvider>(sharedPreferencesProvider);

    /// РЕПОЗИТОРИИ
    /// ------------------------------------------------------------------------
    // Репозиторий игроков
    final IPlayerRepository playerRepository = PlayerRepository(
      sharedPreferencesProvider: sharedPreferencesProvider,
    );
    registry<IPlayerRepository>(playerRepository);

    // Репозиторий Bluetooth
    final IBluetoothRepository bluetoothRepository = BluetoothRepository();
    registry<IBluetoothRepository>(bluetoothRepository);

    /// ------------------------------------------------------------------------
    return this;
  }
}
