import 'package:flutter/foundation.dart';

/// Базовый класс для всех DTO моделей
/// 1. Обеспечивает единый контракт toDomain()
/// 2. Позволяет использовать дженерики для типов доменных моделей
@immutable
abstract class BaseDto<Domain> {
  const BaseDto();

  /// Конвертация DTO в доменную модель
  Domain toDomain();

  /// Конвертация доменной модели в DTO
  static T fromDomain<T extends BaseDto>(T Function() creator) => creator();
}
