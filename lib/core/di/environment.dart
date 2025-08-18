import 'package:shared_preferences/shared_preferences.dart';
import '../data/data_providers/i_cached_data_provider.dart';
import '../data/data_providers/cached_data_provider.dart';
import '../repositories/i_user_repository.dart';
import '../repositories/i_nearby_connections_repository.dart';
import '../repositories/user_repository.dart';
import '../repositories/nearby_connections_repository.dart';
import '../domain/services/nearby_connections_service.dart';
import 'builders.dep_gen.dart';

/// **Класс окружения приложения**
/// Расширяет DepGenEnvironment для регистрации всех долгоживущих компонентов
class Environment extends DepGenEnvironment {
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

    // Сервис Nearby Connections
    final NearbyConnectionsService nearbyService = NearbyConnectionsService();
    registry<NearbyConnectionsService>(nearbyService);

    // Репозиторий Nearby Connections
    final INearbyConnectionsRepository nearbyRepository =
        NearbyConnectionsRepository(nearbyService);
    registry<INearbyConnectionsRepository>(nearbyRepository);

    /// ------------------------------------------------------------------------
    return this;
  }
}
