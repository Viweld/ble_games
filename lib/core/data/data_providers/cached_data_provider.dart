/// Провайдер кэшированных данных (SharedPreferences).
abstract interface class CachedDataProvider {
  Future<String?> getString({required String key});

  Future<void> setString({required String key, required String value});

  Future<bool?> getBool({required String key});

  Future<void> setBool({required String key, required bool value});

  Future<void> deleteValue({required String key});
}
