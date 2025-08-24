import 'package:flutter/foundation.dart';

/// Доменная модель игры
@immutable
class Game {
  /// Создает экземпляр игры
  const Game({
    required this.id,
    required this.name,
    required this.description,
    required this.routeName,
  });

  /// Уникальный идентификатор игры
  final String id;

  /// Название игры
  final String name;

  /// Описание игры
  final String description;

  /// Название роута для навигации к игре
  final String routeName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Game && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Game{id: $id, name: $name, description: $description, routeName: $routeName}';
  }
}
