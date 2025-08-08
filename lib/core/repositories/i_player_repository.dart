import '../domain/models/player.dart';

/// Интерфейс репозитория игроков
abstract class IPlayerRepository {
  /// Получить текущего игрока
  Future<Player?> getCurrentPlayer();

  /// Сохранить текущего игрока
  Future<void> saveCurrentPlayer(Player player);

  /// Удалить текущего игрока
  Future<void> clearCurrentPlayer();

  /// Проверить, является ли это первым запуском
  Future<bool> isFirstLaunch();

  /// Установить флаг первого запуска
  Future<void> setFirstLaunch(bool value);
}
