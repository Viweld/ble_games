import 'package:bluetooth_toe/core/domain/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// Доменная модель устройства
@immutable
class Device {
  const Device({required this.id, required this.name, required this.user});

  final String id;
  final String name;
  final User user;
}
