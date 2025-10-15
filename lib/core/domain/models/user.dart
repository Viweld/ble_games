import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

/// Доменная модель пользователя
@immutable
final class User {
  const User({required this.id, required this.name});

  factory User.fromName(String name) => User(id: const Uuid().v4(), name: name);

  /// Идентификатор пользователя
  /// Должен быть уникальным чтобы исключить коллизии
  final String id;

  /// Имя пользователя
  final String name;
}
