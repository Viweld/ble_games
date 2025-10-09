import 'dart:async';
import 'dart:typed_data';

import 'package:bluetooth_low_energy/bluetooth_low_energy.dart';
import 'package:flutter/services.dart';

import '../../../domain/logger/i_logger.dart';
import '../../../domain/models/exceptions/bluetooth_exceptions.dart';
import '../../../domain/transport/bluetooth/b_bluetooth_connector.dart';
import '../../../domain/transport/bluetooth/i_connector_server.dart';

final class BluetoothConnectorServer extends BBluetoothConnector
    implements IConnectorServer {
  BluetoothConnectorServer({required ILogger logger}) : _log = logger;

  final ILogger _log;
  final _peripheralManager = PeripheralManager();
  GATTCharacteristic? _writeCharacteristic;
  StreamSubscription<GATTCharacteristicWriteRequestedEventArgs>?
  _writeRequestSubscription;
  final Map<String, Central> _connectedClients = {};
  final Map<String, Central> _unverifiedClients = {};

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
  Future<void> confirmConnectionRequest() {
    // TODO: implement confirmConnectionRequest
    throw UnimplementedError();
  }

  @override
  Future<void> rejectConnectionRequest() {
    // TODO: implement rejectConnectionRequest
    throw UnimplementedError();
  }

  @override
  Future<void> sendRawMessage(Uint8List data) async {
    if (_connectedClients.isEmpty || _writeCharacteristic == null) {
      _log.d(
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
  void _peripheralEventHandler(
    GATTCharacteristicWriteRequestedEventArgs event,
  ) {
    _log.d('📥 Получен запрос записи от ${event.central.uuid}');

    try {
      final rawMessage = utf8.decode(event.request.value);
      _log.d('📥 Входящее сообщение: $rawMessage');
      final jsonData = jsonDecode(rawMessage) as Map<String, dynamic>;
      final message = MessageDto.fromJson(jsonData).toDomain();
      if (message is InvitationMessage) {
        _centralInvitationMessageHandler(event, message);
      }
      _incomingMessagesController.add(message);
      _peripheralManager.respondWriteRequest(event.request);
    } catch (e) {
      _log.e('❌ Ошибка обработки входящих данных: $e');
      _peripheralManager.respondWriteRequestWithError(
        event.request,
        error: GATTError.invalidAttributeValueLength,
      );
    }
  }

  void _centralInvitationMessageHandler(
    GATTCharacteristicWriteRequestedEventArgs event,
    InvitationMessage message,
  ) {
    // Проверяем, является ли клиент новым и сохраняем
    final central = event.central;
    final clientId = central.uuid.toString();
    if (_connectedClients.keys.contains(clientId)) return;
    _BluetoothLogger.d('🆕 Новое подключение клиента: $clientId');
    _setConnectionState(
      BluetoothReceivedInvitationState(
        user: message.user,
        device: message.device,
      ),
    );
    _unverifiedClients.addAll({clientId: central});
  }
}
