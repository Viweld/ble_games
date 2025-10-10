import 'package:batuga/core/di/builders.dep_gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          ServerSessionStateConnected() => true,
          _ => false,
        },
        buildWhen: (previous, state) => switch (state) {
          ServerSessionStateView() => true,
          ServerSessionStateError() => true,
          _ => false,
        },
        listener: (context, state) => switch (state) {
          ServerSessionStateConnected() => Navigator.pop(context),
          _ => null,
        },
        builder: (context, state) => switch (state) {
          ServerSessionStateView() => _ServerSessionView(
            onCancelPressed: () => _onCancelPressed(context),
          ),
          ServerSessionStateError(:final message) => _ServerSessionError(
            onCancelPressed: () => _onCancelPressed(context),
            message: message,
          ),
          _ => throw UnsupportedError('${state.runtimeType} нельзя строить'),
        },
      ),
    );
  }

  /// Обработчик нажатия кнопки 'Отмена'
  void _onCancelPressed(BuildContext context) {
    Navigator.pop(context);
  }
}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
/// Ожидание подключения
class _ServerSessionView extends StatelessWidget {
  const _ServerSessionView({required this.onCancelPressed});

  /// Коллбэк отмены
  final VoidCallback onCancelPressed;

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
