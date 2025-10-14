import 'dart:async';

import 'package:bluetooth_low_energy/bluetooth_low_energy.dart';
import 'package:flutter/foundation.dart';

import '../../../../domain/transport/i_transport_link.dart';

abstract base class BleLinkBase implements ITransportLink {
  BleLinkBase({
    required this.appName,
    required String serviceId,
    required String characteristicId,
  }) : serviceUuid = UUID.fromString(serviceId),
       characteristicUuid = UUID.fromString(characteristicId);

  // ПУБЛИЧНЫЕ МЕТОДЫ И СВОЙСТВА
  // ---------------------------------------------------------------------------
  @override
  Stream<Uint8List> get incomingRawMessageStream =>
      _incomingRawMessageController.stream;

  @override
  Future<void> sendRawMessage(Uint8List data);

  @override
  Future<void> disconnect();

  @override
  Future<void> dispose() async {
    await onDispose();
    await _incomingRawMessageController.close();
  }

  // ЗАЩИЩЕННЫЕ И ПРИВАТНЫЕ МЕТОДЫ И СВОЙСТВА
  // ---------------------------------------------------------------------------
  /// Контроллер потока входящих сырых данных
  final _incomingRawMessageController = StreamController<Uint8List>.broadcast();

  /// UUID сервиса и характеристики приложения
  @protected
  final UUID serviceUuid;

  /// UUID характеристики приложения
  @protected
  final UUID characteristicUuid;

  /// Уникальное имя приложения для идентификации
  @protected
  final String appName;

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
