import '../models/user.dart';

/// Репозиторий пользователей приложения.
abstract interface class UserRepository {
  Future<User?> getCurrentUser();

  Future<void> saveCurrentUser(User user);

  Future<void> clearCurrentUser();

  Future<bool> isFirstLaunch();

  Future<void> setFirstLaunch(bool value);
}
