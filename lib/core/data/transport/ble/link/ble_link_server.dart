import 'dart:async';

import 'package:bluetooth_low_energy/bluetooth_low_energy.dart';
import 'package:flutter/services.dart';

import '../../../../domain/logger/i_logger.dart';
import '../../../../domain/models/exceptions/bluetooth_exceptions.dart';
import '../../../../domain/transport/i_transport_link_server.dart';
import 'ble_link_base.dart';

final class BleLinkServer extends BleLinkBase implements ITransportLinkServer {
  BleLinkServer({required ILogger logger}) : _log = logger;

  final ILogger _log;
  final _peripheralManager = PeripheralManager();
  GATTCharacteristic? _writeCharacteristic;
  StreamSubscription<GATTCharacteristicWriteRequestedEventArgs>?
  _writeRequestSubscription;
  final Map<String, Central> _connectedClients = {};
  Completer<bool>? _confirmCompleter;

  @override
  Future<void> startAdvertising() async {
    _log.d('\n📡 Запуск рекламы Bluetooth сервиса...');
    try {
      await stopAdvertising();

      // Создаем характеристику для записи и уведомлений
      _writeCharacteristic = GATTCharacteristic.mutable(
        uuid: super.characteristicUuid,
        properties: [
          GATTCharacteristicProperty.read,
          GATTCharacteristicProperty.write,
          GATTCharacteristicProperty.notify,
        ],
        permissions: [
          GATTCharacteristicPermission.read,
          GATTCharacteristicPermission.write,
        ],
        descriptors: [],
      );

      // Создаем сервис с характеристикой
      final service = GATTService(
        uuid: super.serviceUuid,
        isPrimary: true,
        includedServices: [],
        characteristics: [_writeCharacteristic!],
      );

      // Добавляем сервис
      await _peripheralManager.addService(service);
      _log.d('✅ Сервис добавлен');

      // Настраиваем обработку записи в характеристику
      _writeRequestSubscription = _peripheralManager
          .characteristicWriteRequested
          .listen(_peripheralEventHandler);

      // Начинаем рекламу с нашим именем и специальными данными
      await _peripheralManager.startAdvertising(
        Advertisement(
          name: super.deviceName,
          serviceUUIDs: [super.serviceUuid],
        ),
      );
    } on Object catch (e) {
      _log.e('❌ Ошибка запуска рекламы: $e');
      if (e is! PlatformException) rethrow;
      if (e.code.contains('IllegalStateException')) {
        throw BluetoothDisabledException();
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<void> stopAdvertising() async {
    _log.d('🛑 Остановка рекламы Bluetooth сервиса...');

    try {
      await _peripheralManager.stopAdvertising();
      await _writeRequestSubscription?.cancel();
      _writeRequestSubscription = null;
    } catch (e) {
      _log.e('⚠️ Ошибка остановки рекламы: $e');
    }
  }

  @override
  Future<void> confirmConnectionRequest() async {
    if (_confirmCompleter == null || _confirmCompleter!.isCompleted) {
      _log.w(
        '⚠️ Нет активного запроса на подтверждение подключения для отклонения',
      );
      return;
    }
    _confirmCompleter!.complete(true);
    _confirmCompleter = null;
  }

  @override
  Future<void> rejectConnectionRequest() async {
    if (_confirmCompleter == null || _confirmCompleter!.isCompleted) {
      _log.w(
        '⚠️ Нет активного запроса на подтверждение подключения для отклонения',
      );
      return;
    }
    _confirmCompleter!.complete(false);
    _confirmCompleter = null;
  }

  @override
  Future<void> sendRawMessage(Uint8List data) async {
    if (_connectedClients.isEmpty || _writeCharacteristic == null) {
      _log.w(
        '⚠️ Нет подключённых клиентов для уведомления или характеристики для записи',
      );
      return;
    }

    for (final client in _connectedClients.entries) {
      try {
        await _peripheralManager.notifyCharacteristic(
          client.value,
          _writeCharacteristic!,
          value: data,
        );
        _log.d('📤 Уведомление отправлено клиенту: ${client.key}');
      } catch (e) {
        _log.e('❌ Ошибка уведомления клиента ${client.key}: $e');
      }
    }
  }

  @override
  Future<void> disconnect() async {
    _log.d('🔌 Отключение от устройства...');
    try {
      _connectedClients.clear();
      _writeCharacteristic = null;
    } catch (e) {
      _log.e('⚠️ Ошибка отключения: $e');
    }
  }

  @override
  Future<void> onDispose() async {
    _log.d('🧹 Начата очистка ресурсов BluetoothConnectorServer...');
    await _writeRequestSubscription?.cancel();
    await stopAdvertising();
    await disconnect();
    _log.d('🧹 Завершена очистка ресурсов BluetoothConnectorServer...');
  }

  // ВСПОМОГАТЕЛЬНЫЕ МЕТОДЫ
  // ---------------------------------------------------------------------------
  Future<void> _peripheralEventHandler(
    GATTCharacteristicWriteRequestedEventArgs event,
  ) async {
    _log.d('📥 Получен запрос записи от ${event.central.uuid}');
    super.translateIncomingData(event.request.value);

    try {
      // проверяем есть ли такой клиент в списке подключенных
      if (!_connectedClients.keys.contains(event.central.uuid.toString())) {
        await _handleNewClientConnection(event);
      } else {
        _log.d('🔔 Запрос записи от известного клиента');
        await _peripheralManager.respondWriteRequest(event.request);
      }
    } catch (e) {
      _log.e('❌ Ошибка обработки входящих данных: $e');
      await _peripheralManager.respondWriteRequestWithError(
        event.request,
        error: GATTError.invalidAttributeValueLength,
      );
    }
  }

  /// Обработка нового подключения клиента
  Future<void> _handleNewClientConnection(
    GATTCharacteristicWriteRequestedEventArgs event,
  ) async {
    // TODO(Vadim): Подумать над случаем если в момент подтверждения поступит запрос от другого клиента
    // TODO(Vadim): Подумать над случаем если клиент отключится в момент подтверждения
    // TODO(Vadim): Добавить таймаут на подтверждение

    if (_confirmCompleter == null) {
      final clientId = event.central.uuid.toString();
      _connectedClients[clientId] = event.central;
      _confirmCompleter = Completer<bool>();
      final isConfirmed = await _confirmCompleter!.future;
      if (isConfirmed) return;
      _connectedClients.remove(clientId);
    }
  }
}
