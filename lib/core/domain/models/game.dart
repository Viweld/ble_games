/// Модель игры
class Game {
  final String id;
  final String name;
  final String description;
  final String icon;
  final bool isAvailable;
  final String route;

  const Game({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.isAvailable,
    required this.route,
  });
}
