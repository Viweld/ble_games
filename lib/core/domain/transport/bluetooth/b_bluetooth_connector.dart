import 'dart:async';

import 'package:batuga/core/domain/services/bluetooth_manager/i_bluetooth_connection.dart';
import 'package:bluetooth_low_energy/bluetooth_low_energy.dart';
import 'package:flutter/foundation.dart';

/// Базовый класс для Bluetooth коннектора (клиент или сервер).
/// Содержит общие методы и свойства для работы с Bluetooth соединением.
abstract base class BBluetoothConnector {
  // ПУБЛИЧНЫЕ МЕТОДЫ И СВОЙСТВА
  // ---------------------------------------------------------------------------
  /// Поток входящих сырых данных
  Stream<Uint8List> get incomingRawMessageStream =>
      _incomingRawMessageController.stream;

  /// Отправить сырые данные
  Future<void> sendRawMessage(Uint8List data);

  /// Отключиться от устройства
  Future<void> disconnect();

  /// Освободить ресурсы
  Future<void> dispose() async {
    await onDispose();
    await _incomingRawMessageController.close();
  }

  // ЗАЩИЩЕННЫЕ И ПРИВАТНЫЕ МЕТОДЫ И СВОЙСТВА
  // ---------------------------------------------------------------------------
  /// Контроллер потока входящих сырых данных
  final _incomingRawMessageController = StreamController<Uint8List>.broadcast();

  /// Часть UUID для всех сервисов и характеристик приложения
  static const _appUuidPart = '0000-1000-8000-00805f9b34fb';

  /// UUID сервиса и характеристики приложения
  @protected
  final serviceUuid = UUID.fromString('0000a7c0-$_appUuidPart');

  /// UUID характеристики приложения
  @protected
  final characteristicUuid = UUID.fromString('0000a7c1-$_appUuidPart');

  /// Уникальное имя приложения для идентификации
  @protected
  late final appName = '🎮BaTuGa';

  // TODO(Vadim): сделать возможность переопределения имени устройства, например, через
  // todo - конструктор
  // todo - сеттер
  // todo - метод инициализации
  // todo - параметры платформы (Android, iOS)
  // todo - настройки приложения
  // todo - профиль пользователя
  // todo - генерацию случайного имени при первом запуске
  // todo - сохранение имени в локальное хранилище
  // todo - получение имени от сервера
  // todo - получение имени от пользователя
  // todo - получение имени от другого устройства
  // todo - получение имени от системных настроек
  /// Уникальное имя устройства для идентификации
  @protected
  late final deviceName = '$appName-УСТРОЙСТВО';

  /// Переводит входящие сырые данные в поток
  @protected
  void translateIncomingData(Uint8List value) {
    if (_incomingRawMessageController.isClosed) return;
    _incomingRawMessageController.add(value);
  }

  /// Освободить ресурсы в подклассах
  @protected
  Future<void> onDispose();
}
