import 'package:shared_preferences/shared_preferences.dart';

import 'cached_data_provider.dart';

final class CachedDataProviderImpl implements CachedDataProvider {
  CachedDataProviderImpl(this._prefs);

  final SharedPreferences _prefs;

  @override
  Future<String?> getString({required String key}) async => _prefs.getString(key);

  @override
  Future<void> setString({required String key, required String value}) async {
    await _prefs.setString(key, value);
  }

  @override
  Future<bool?> getBool({required String key}) async => _prefs.getBool(key);

  @override
  Future<void> setBool({required String key, required bool value}) async {
    await _prefs.setBool(key, value);
  }

  @override
  Future<void> deleteValue({required String key}) async {
    await _prefs.remove(key);
  }

  Future<void> clearValues() async {
    await _prefs.clear();
  }
}
