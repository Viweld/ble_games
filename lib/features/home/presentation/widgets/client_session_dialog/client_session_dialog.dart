import 'package:batuga/core/di/builders.dep_gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/models/device.dart';
import '../../../../../core/presentation/widgets/common_error.dart';
import '../../../../../core/presentation/widgets/common_progress_indicator.dart';
import 'bloc/client_session_bloc.dart';

/// Диалог подключения с качестве клиента
class ClientSessionDialog extends StatelessWidget {
  const ClientSessionDialog._();

  static const widthFraction = 0.9;
  static const heightFraction = 0.6;

  static Future<void> show(BuildContext context) => showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (context) => const ClientSessionDialog._(),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DepProvider.of(context).buildClientSessionBloc(),
      child: BlocBuilder<ClientSessionBloc, ClientSessionState>(
        buildWhen: (previous, state) => switch (state) {
          ClientSessionStateView() => true,
          ClientSessionStateInitializationPending() => true,
          ClientSessionStateInitializationError() => true,
          ClientSessionStateRemoteConfirmationPending() => true,
          ClientSessionStateInvitationAccepted() => true,
          ClientSessionStateInvitationRejected() => true,
          _ => false,
        },
        builder: (context, state) => switch (state) {
          ClientSessionStateInitializationPending() =>
            _ClientSessionInitializationPending(
              onCancelPressed: () => _onCloseDialog(context),
            ),
          ClientSessionStateView(:final devices, :final selectedDevice) =>
            _ClientSessionView(
              devices: devices,
              selectedDevice: selectedDevice,
              onDeviceSelected: (device) => _onDeviceSelected(context, device),
              onConnectPressed: () => _onConnectPressed(context),
              onCancelPressed: () => _onCloseDialog(context),
            ),
          ClientSessionStateInitializationError(:final message) =>
            _ClientSessionInitializationError(
              onCancelPressed: () => _onCloseDialog(context),
              message: message,
            ),
          ClientSessionStateRemoteConfirmationPending() =>
            _ClientSessionRemoteConfirmationPending(
              onClosePressed: () => _onCloseDialog(context),
            ),
          ClientSessionStateInvitationAccepted() =>
            _ClientSessionInvitationAccepted(
              onClosePressed: () => _onCloseDialog(context),
            ),
          ClientSessionStateInvitationRejected() =>
            _ClientSessionInvitationRejected(
              onClosePressed: () => _onCloseDialog(context),
            ),
          _ => throw UnsupportedError('${state.runtimeType} нельзя строить'),
        },
      ),
    );
  }

  /// Обработчик выбора устройства
  void _onDeviceSelected(BuildContext context, Device device) {
    context.read<ClientSessionBloc>().add(
      ClientSessionEvent.onDeviceSelected(device: device),
    );
  }

  /// Обработчик нажатия кнопки 'Подключиться'
  void _onConnectPressed(BuildContext context) {
    context.read<ClientSessionBloc>().add(
      const ClientSessionEvent.onConnectToDevice(),
    );
  }

  /// Обработчик нажатия кнопки 'Отмена'
  void _onCloseDialog(BuildContext context) {
    Navigator.pop(context);
  }
}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
/// Вью со списком найденных устройств
class _ClientSessionView extends StatelessWidget {
  const _ClientSessionView({
    required this.devices,
    required this.selectedDevice,
    required this.onDeviceSelected,
    required this.onConnectPressed,
    required this.onCancelPressed,
  });

  /// Список найденных устройств
  final List<Device> devices;

  /// Выбранное устройство
  final Device? selectedDevice;

  /// Коллбэк выбора устройства
  final ValueChanged<Device> onDeviceSelected;

  /// Коллбэк подключения
  final VoidCallback onConnectPressed;

  /// Коллбэк отмены
  final VoidCallback onCancelPressed;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return AlertDialog(
      title: const Text('Найденные устройства', textAlign: TextAlign.center),
      content: SizedBox(
        width: screenSize.width * ClientSessionDialog.widthFraction,
        height: screenSize.height * ClientSessionDialog.heightFraction,
        child: devices.isEmpty
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonProgressIndicator(),
                    SizedBox(height: 16),
                    Text('Поиск устройств...'),
                  ],
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: devices.length,
                itemBuilder: (context, index) {
                  final device = devices[index];
                  final isSelected = selectedDevice?.id == device.id;

                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    color: isSelected
                        ? Theme.of(context).primaryColor.withValues(alpha: 0.3)
                        : null,
                    child: ListTile(
                      leading: device.isOurApp
                          ? const Icon(
                              Icons.games,
                              color: Colors.green,
                              size: 28,
                            )
                          : Icon(
                              Icons.bluetooth,
                              color: isSelected
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey,
                            ),
                      title: Text(
                        device.name.isEmpty
                            ? 'Неизвестное устройство'
                            : device.name,
                        style: TextStyle(
                          fontWeight: isSelected ? FontWeight.bold : null,
                          color: device.isOurApp ? Colors.green : null,
                        ),
                      ),
                      subtitle: device.isOurApp
                          ? const Text(
                              '🎮 Приложение BaTuGa',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 12,
                              ),
                            )
                          : null,
                      trailing: isSelected
                          ? Icon(
                              Icons.check_circle,
                              color: Theme.of(context).primaryColor,
                            )
                          : device.isOurApp
                          ? const Icon(
                              Icons.star,
                              color: Colors.green,
                              size: 20,
                            )
                          : null,
                      onTap: () => onDeviceSelected(device),
                    ),
                  );
                },
              ),
      ),
      actions: [
        Row(
          children: [
            /// Кнопка отмены
            Expanded(
              child: ElevatedButton(
                onPressed: onCancelPressed,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                child: const Text('Отмена'),
              ),
            ),
            const SizedBox(width: 16),

            /// Кнопка подключения
            Expanded(
              child: ElevatedButton(
                onPressed: selectedDevice != null ? onConnectPressed : null,
                child: const Text('Подключиться'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
/// Ошибка ожидания подключения
class _ClientSessionInitializationError extends StatelessWidget {
  const _ClientSessionInitializationError({
    required this.onCancelPressed,
    this.message,
  });

  /// Коллбэк отмены
  final VoidCallback onCancelPressed;

  /// Сообщение об ошибке
  final String? message;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return AlertDialog(
      title: const Text(
        'Ошибка ожидания подключения!',
        textAlign: TextAlign.center,
      ),
      content: SizedBox(
        width: screenSize.width * ClientSessionDialog.widthFraction,
        height: screenSize.height * ClientSessionDialog.heightFraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: CommonError(),
            ),
            if (message != null) Text(message!, textAlign: TextAlign.center),
          ],
        ),
      ),
      actions: [
        /// Кнопка отмены
        ElevatedButton(
          onPressed: onCancelPressed,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
          child: const Text('Отмена'),
        ),
      ],
    );
  }
}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
/// Ожидание инициализации
class _ClientSessionInitializationPending extends StatelessWidget {
  const _ClientSessionInitializationPending({required this.onCancelPressed});

  /// Коллбэк отмены
  final VoidCallback onCancelPressed;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return AlertDialog(
      title: const Text('Найденные устройства', textAlign: TextAlign.center),
      content: SizedBox(
        width: screenSize.width * ClientSessionDialog.widthFraction,
        height: screenSize.height * ClientSessionDialog.heightFraction,
        child: const Column(
          children: [
            CommonProgressIndicator(),
            Text('Загрузка...', textAlign: TextAlign.center),
          ],
        ),
      ),
      actions: [
        /// Кнопка отмены
        ElevatedButton(
          onPressed: onCancelPressed,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
          child: const Text('Отмена'),
        ),
      ],
    );
  }
}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
/// Ожидание подтверждения
class _ClientSessionRemoteConfirmationPending extends StatelessWidget {
  const _ClientSessionRemoteConfirmationPending({required this.onClosePressed});

  /// Коллбэк закрытия
  final VoidCallback onClosePressed;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return AlertDialog(
      title: const Text('Приглашение отправлено', textAlign: TextAlign.center),
      content: SizedBox(
        width: screenSize.width * ClientSessionDialog.widthFraction,
        height: screenSize.height * ClientSessionDialog.heightFraction,
        child: const Column(
          children: [Text('Ждите подтверждения', textAlign: TextAlign.center)],
        ),
      ),
      actions: [
        /// Кнопка отмены
        ElevatedButton(
          onPressed: onClosePressed,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
          child: const Text('Отмена'),
        ),
      ],
    );
  }
}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
/// Сервер принял приглашение
class _ClientSessionInvitationAccepted extends StatelessWidget {
  const _ClientSessionInvitationAccepted({required this.onClosePressed});

  /// Коллбэк закрытия
  final VoidCallback onClosePressed;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return AlertDialog(
      title: const Text('Приглашение принято', textAlign: TextAlign.center),
      content: SizedBox(
        width: screenSize.width * ClientSessionDialog.widthFraction,
        height: screenSize.height * ClientSessionDialog.heightFraction,
        child: const Column(
          children: [Text('Ура!', textAlign: TextAlign.center)],
        ),
      ),
      actions: [
        /// Кнопка отмены
        ElevatedButton(
          onPressed: onClosePressed,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
          child: const Text('Хорошо'),
        ),
      ],
    );
  }
}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
/// Сервер принял приглашение
class _ClientSessionInvitationRejected extends StatelessWidget {
  const _ClientSessionInvitationRejected({required this.onClosePressed});

  /// Коллбэк закрытия
  final VoidCallback onClosePressed;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return AlertDialog(
      title: const Text('Приглашение отклонено', textAlign: TextAlign.center),
      content: SizedBox(
        width: screenSize.width * ClientSessionDialog.widthFraction,
        height: screenSize.height * ClientSessionDialog.heightFraction,
        child: const Column(
          children: [Text('О нет..', textAlign: TextAlign.center)],
        ),
      ),
      actions: [
        /// Кнопка отмены
        ElevatedButton(
          onPressed: onClosePressed,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
          child: const Text('Жаль...'),
        ),
      ],
    );
  }
}
