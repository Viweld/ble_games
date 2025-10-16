import 'package:batuga/core/di/builders.dep_gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/models/device.dart';
import '../../../../../core/domain/models/user.dart';
import '../../../../../core/presentation/widgets/common_awaiting.dart';
import '../../../../../core/presentation/widgets/common_error.dart';
import 'bloc/server_session_bloc.dart';

/// Диалог ожидания подключения в роли сервера
class ServerSessionDialog extends StatelessWidget {
  const ServerSessionDialog._();

  static const widthFraction = 0.9;
  static const heightFraction = 0.40;

  static Future<void> show(BuildContext context) => showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (context) => const ServerSessionDialog._(),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DepProvider.of(context).buildServerSessionBloc(),
      child: BlocConsumer<ServerSessionBloc, ServerSessionState>(
        listenWhen: (previous, state) => switch (state) {
          ServerSessionStateCloseDialog() => true,
          _ => false,
        },
        buildWhen: (previous, state) => switch (state) {
          ServerSessionStateInvitationPending() => true,
          ServerSessionStateError() => true,
          ServerSessionStateUserDecision() => true,
          _ => false,
        },
        listener: (context, state) => switch (state) {
          ServerSessionStateCloseDialog() => _closeDialog(context),
          _ => null,
        },
        builder: (context, state) => switch (state) {
          ServerSessionStateInvitationPending() =>
            _ServerSessionInvitationPending(
              onCancelTapped: () => _closeDialog(context),
            ),
          ServerSessionStateUserDecision() => _ServerSessionUserDecision(
            remoteUser: state.remoteUser,
            remoteDevice: state.remoteDevice,
            onAcceptTapped: () => _onAcceptTapped(context),
            onRejectTapped: () => _onRejectTapped(context),
          ),
          ServerSessionStateError(:final message) => _ServerSessionError(
            onCancelPressed: () => _closeDialog(context),
            message: message,
          ),
          _ => throw UnsupportedError('${state.runtimeType} нельзя строить'),
        },
      ),
    );
  }

  /// Обработчик нажатия кнопки 'Отмена'
  void _closeDialog(BuildContext context) {
    Navigator.pop(context);
  }

  void _onAcceptTapped(BuildContext context) {
    context.read<ServerSessionBloc>().add(
      const ServerSessionEvent.onAcceptTapped(),
    );
  }

  void _onRejectTapped(BuildContext context) {
    context.read<ServerSessionBloc>().add(
      const ServerSessionEvent.onRejectTapped(),
    );
  }
}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
/// Ожидание приглашения
class _ServerSessionInvitationPending extends StatelessWidget {
  const _ServerSessionInvitationPending({required this.onCancelTapped});

  /// Коллбэк отмены
  final VoidCallback onCancelTapped;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return AlertDialog(
      title: const Text('Ожидание подключения...', textAlign: TextAlign.center),
      content: SizedBox(
        width: screenSize.width * ServerSessionDialog.widthFraction,
        height: screenSize.height * ServerSessionDialog.heightFraction,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: CommonAwaiting(),
            ),
            Text(
              'Ваше устройство видимо для других устройств',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      actions: [
        /// Кнопка отмены
        ElevatedButton(
          onPressed: onCancelTapped,
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
/// Ожидание решения пользователя
class _ServerSessionUserDecision extends StatelessWidget {
  const _ServerSessionUserDecision({
    required this.remoteUser,
    required this.remoteDevice,
    required this.onAcceptTapped,
    required this.onRejectTapped,
  });

  /// Пользователь удаленного устройства
  final User remoteUser;

  /// Данные удаленного устройства
  final Device remoteDevice;

  /// Коллбэк отмены
  final VoidCallback onAcceptTapped;

  /// Коллбэк отмены
  final VoidCallback onRejectTapped;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return AlertDialog(
      title: const Text('Получено приглашение', textAlign: TextAlign.center),
      content: SizedBox(
        width: screenSize.width * ServerSessionDialog.widthFraction,
        height: screenSize.height * ServerSessionDialog.heightFraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Получено приглашение от устройства ${remoteDevice.name}',
              textAlign: TextAlign.center,
            ),
            Text(
              'Имя пользователя: ${remoteUser.name}',
              textAlign: TextAlign.center,
            ),
            const Text('РИМИТЕ РЕШЕНИЕ', textAlign: TextAlign.center),
          ],
        ),
      ),
      actions: [
        Row(
          children: [
            /// Кнопка "отклонить приглашение"
            Expanded(
              child: ElevatedButton(
                onPressed: onRejectTapped,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                child: const Text('Отклонить'),
              ),
            ),

            /// Кнопка "принять приглашение"
            Expanded(
              child: ElevatedButton(
                onPressed: onAcceptTapped,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                child: const Text('Принять'),
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
class _ServerSessionError extends StatelessWidget {
  const _ServerSessionError({required this.onCancelPressed, this.message});

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
        width: screenSize.width * ServerSessionDialog.widthFraction,
        height: screenSize.height * ServerSessionDialog.heightFraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: CommonError(),
            ),
            if (message != null)
              Expanded(
                child: SingleChildScrollView(
                  child: Text(message!, textAlign: TextAlign.center),
                ),
              ),
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
