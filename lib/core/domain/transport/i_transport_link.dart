import 'dart:typed_data';

/// Интерфейс транспортного канала
abstract interface class ITransportLink {
  /// Поток входящих сырых данных
  Stream<Uint8List> get incomingRawMessageStream;

  /// Отправить сырые данные
  Future<void> sendRawMessage(Uint8List data);

  /// Отключиться от устройства
  Future<void> disconnect();

  /// Освободить ресурсы
  Future<void> dispose();
}
