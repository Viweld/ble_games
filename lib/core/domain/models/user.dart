import 'package:freezed_annotation/freezed_annotation.dart';

/// Доменная модель пользователя
@immutable
class User {
  const User({required this.id, required this.name});

  /// Идентификатор пользователя
  /// Должен быть уникальным чтобы исключить коллизии
  final String id;

  /// Имя пользователя
  final String name;
}
