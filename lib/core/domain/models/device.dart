import 'package:freezed_annotation/freezed_annotation.dart';

/// Доменная модель устройства
@immutable
final class Device {
  const Device({required this.id, required this.name, this.isOurApp = false});

  /// Идентификатор устройства
  final String id;

  /// Наименование устройства
  final String name;

  /// Флаг, указывающий, что это устройство с запущенным приложением
  final bool isOurApp;
}
