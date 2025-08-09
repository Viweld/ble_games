import '../domain/models/user.dart';

/// Интерфейс репозитория пользователей
abstract class IUserRepository {
  /// Получить текущего пользователя
  Future<User?> getCurrentUser();

  /// Сохранить текущего пользователя
  Future<void> saveCurrentUser(User user);

  /// Удалить текущего пользователя
  Future<void> clearCurrentUser();

  /// Проверить, является ли это первым запуском
  Future<bool> isFirstLaunch();

  /// Установить флаг первого запуска
  Future<void> setFirstLaunch(bool value);
}
