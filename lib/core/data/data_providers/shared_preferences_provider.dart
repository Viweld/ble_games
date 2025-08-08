import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import 'i_shared_preferences_provider.dart';

/// Реализация провайдера данных SharedPreferences
class SharedPreferencesProvider implements ISharedPreferencesProvider {
  const SharedPreferencesProvider(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  /// Чтение строки по ключу
  @override
  Future<String?> getString({required String key}) async {
    return _sharedPreferences.getString(key);
  }

  /// Сохранение строки по ключу
  @override
  Future<void> setString({required String key, required String value}) async {
    await _sharedPreferences.setString(key, value);
    await _sharedPreferences.reload();
  }

  /// Чтение булевого значения по ключу
  @override
  Future<bool?> getBool({required String key}) async {
    return _sharedPreferences.getBool(key);
  }

  /// Сохранение булевого значения по ключу
  @override
  Future<void> setBool({required String key, required bool value}) async {
    await _sharedPreferences.setBool(key, value);
    await _sharedPreferences.reload();
  }

  /// Удаление значения по ключу
  @override
  Future<void> deleteValue({required String key}) async {
    await _sharedPreferences.remove(key);
    await _sharedPreferences.reload();
  }

  /// Очистка хранилища
  @override
  Future<void> clearValues() async {
    await _sharedPreferences.clear();
  }
}
