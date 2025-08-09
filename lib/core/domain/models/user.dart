import 'package:freezed_annotation/freezed_annotation.dart';

/// Доменная модель пользователя
@immutable
class User {
  const User({required this.id, required this.name});

  final String id;
  final String name;
}
