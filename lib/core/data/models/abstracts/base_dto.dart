import 'package:freezed_annotation/freezed_annotation.dart';

/// Базовый класс для всех DTO моделей
/// 1. Обеспечивает единый контракт toDomain()
/// 2. Позволяет использовать дженерики для типов доменных моделей
@immutable
abstract class BaseDto<Domain> {
  const BaseDto();

  /// Конвертация DTO в доменную модель
  @mustBeOverridden
  Domain toDomain();

  /// Универсальная фабрика для создания конкретного наследника BaseDto из JSON
  static T fromJson<T extends BaseDto>(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) creator,
  ) {
    return creator(json);
  }

  /// Универсальная сериализация в JSON (делегирует в конкретный класс)
  @mustBeOverridden
  Map<String, dynamic> toJson();

  /// Конвертация доменной модели в DTO
  static T fromDomain<T extends BaseDto>(T Function() creator) => creator();
}
