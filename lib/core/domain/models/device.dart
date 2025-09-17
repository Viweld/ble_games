import 'package:freezed_annotation/freezed_annotation.dart';

/// Доменная модель устройства
@immutable
class Device {
  const Device({required this.id, required this.name, this.isOurApp = false});

  final String id;
  final String name;
  final bool isOurApp;
}
