import 'dart:async';
import '../models/messages.dart';

/// Интерфейс сервиса Nearby Connections
abstract class INearbyConnectionsService {
  /// Поток активных соединений
  Stream<Map<String, String>> get connections;

  /// Поток входящих сообщений
  Stream<Message> get messages;

  /// Получить список активных соединений
  Map<String, String> get connectionsList;

  /// Проверить, есть ли активные соединения
  bool get hasConnections;

  /// Инициализация сервиса
  Future<void> initialize();

  /// Начать поиск устройств
  Future<void> startDiscovery();

  /// Остановить поиск устройств
  Future<void> stopDiscovery();

  /// Начать рекламу (быть видимым для других устройств)
  Future<void> startAdvertising();

  /// Остановить рекламу
  Future<void> stopAdvertising();

  /// Подключиться к устройству
  Future<void> connectToDevice(String endpointId);

  /// Отправить сообщение
  Future<void> sendMessage(String endpointId, Message message);

  /// Отключиться от устройства
  Future<void> disconnect(String endpointId);

  /// Отключиться от всех устройств
  Future<void> disconnectAll();

  /// Освободить ресурсы
  void dispose();
}
