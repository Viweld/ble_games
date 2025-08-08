import 'dart:convert';

import '../data/data_providers/i_shared_preferences_provider.dart';
import '../domain/models/player.dart';
import 'i_player_repository.dart';

/// Реализация репозитория игроков
class PlayerRepository implements IPlayerRepository {
  const PlayerRepository({
    required ISharedPreferencesProvider sharedPreferencesProvider,
  }) : _sharedPreferencesProvider = sharedPreferencesProvider;

  final ISharedPreferencesProvider _sharedPreferencesProvider;

  /// Ключи для хранения данных
  static const String _currentPlayerKey = 'current_player';
  static const String _isFirstLaunchKey = 'is_first_launch';

  @override
  Future<Player?> getCurrentPlayer() async {
    final playerJson = await _sharedPreferencesProvider.getString(
      key: _currentPlayerKey,
    );

    if (playerJson == null) return null;

    try {
      final playerMap = jsonDecode(playerJson) as Map<String, dynamic>;
      return Player.fromJson(playerMap);
    } catch (e) {
      // Если данные повреждены, удаляем их
      await _sharedPreferencesProvider.deleteValue(key: _currentPlayerKey);
      return null;
    }
  }

  @override
  Future<void> saveCurrentPlayer(Player player) async {
    final playerJson = jsonEncode(player.toJson());
    await _sharedPreferencesProvider.setString(
      key: _currentPlayerKey,
      value: playerJson,
    );
  }

  @override
  Future<void> clearCurrentPlayer() async {
    await _sharedPreferencesProvider.deleteValue(key: _currentPlayerKey);
  }

  @override
  Future<bool> isFirstLaunch() async {
    final isFirstLaunch = await _sharedPreferencesProvider.getBool(
      key: _isFirstLaunchKey,
    );
    return isFirstLaunch ?? true;
  }

  @override
  Future<void> setFirstLaunch(bool value) async {
    await _sharedPreferencesProvider.setBool(
      key: _isFirstLaunchKey,
      value: value,
    );
  }
}
