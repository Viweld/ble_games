import 'dart:async';

/// Интерфейс провайдера данных SharedPreferences
abstract class ICachedDataProvider {
  /// Чтение строки по ключу
  Future<String?> getString({required String key});

  /// Сохранение строки по ключу
  Future<void> setString({required String key, required String value});

  /// Чтение булевого значения по ключу
  Future<bool?> getBool({required String key});

  /// Сохранение булевого значения по ключу
  Future<void> setBool({required String key, required bool value});

  /// Удаление значения по ключу
  Future<void> deleteValue({required String key});

  /// Очистка хранилища
  Future<void> clearValues();
}
