import 'dart:convert';

import '../../data/data_providers/i_cached_data_provider.dart';
import '../../data/models/user_dto.dart';
import '../../domain/models/user.dart';
import '../../domain/repositories/i_user_repository.dart';

/// Реализация репозитория игроков
class UserRepository implements IUserRepository {
  const UserRepository({required ICachedDataProvider cachedDataProvider})
    : _cachedDataProvider = cachedDataProvider;

  final ICachedDataProvider _cachedDataProvider;

  /// Ключи для хранения данных
  static const String _userKey = 'current_user';
  static const String _launchKey = 'first_launch';

  @override
  Future<User?> getCurrentUser() async {
    try {
      final playerJson = await _cachedDataProvider.getString(key: _userKey);
      if (playerJson == null) return null;
      final playerMap = jsonDecode(playerJson) as Map<String, dynamic>;
      return UserDto.fromJson(playerMap).toDomain();
    } catch (e) {
      // Если данные повреждены, удаляем их
      await _cachedDataProvider.deleteValue(key: _userKey);
      return null;
    }
  }

  @override
  Future<void> saveCurrentUser(User user) async {
    final userJson = jsonEncode(UserDto.fromDomain(user).toJson());
    await _cachedDataProvider.setString(key: _userKey, value: userJson);
  }

  @override
  Future<void> clearCurrentUser() async {
    await _cachedDataProvider.deleteValue(key: _userKey);
  }

  @override
  Future<bool> isFirstLaunch() async {
    final isFirstLaunch = await _cachedDataProvider.getBool(key: _launchKey);
    return isFirstLaunch ?? true;
  }

  @override
  Future<void> setFirstLaunch(bool value) async {
    await _cachedDataProvider.setBool(key: _launchKey, value: value);
  }
}
