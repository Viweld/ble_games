import 'package:batuga/core/di/builders.dep_gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/widgets/common_awaiting.dart';
import '../../../../../core/presentation/widgets/common_error.dart';
import 'bloc/awaiting_connection_bloc.dart';

/// Диалог ввода псевдонима
class AwaitingConnectionDialog extends StatelessWidget {
  const AwaitingConnectionDialog._();

  static const widthFraction = 0.9;
  static const heightFraction = 0.40;

  static Future<void> show(BuildContext context) => showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (context) => AwaitingConnectionDialog._(),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DepProvider.of(context).buildAwaitingConnectionBloc(),
      child: BlocConsumer<AwaitingConnectionBloc, AwaitingConnectionState>(
        listenWhen: (previous, state) => switch (state) {
          AwaitingConnectionStateConnected() => true,
          _ => false,
        },
        buildWhen: (previous, state) => switch (state) {
          AwaitingConnectionStateView() => true,
          AwaitingConnectionStateError() => true,
          _ => false,
        },
        listener: (context, state) => switch (state) {
          AwaitingConnectionStateConnected() => Navigator.pop(context),
          _ => null,
        },
        builder: (context, state) => switch (state) {
          AwaitingConnectionStateView() => _AwaitingConnectionView(
            onCancelPressed: () => _onCancelPressed(context),
          ),
          AwaitingConnectionStateError(:final message) =>
            _AwaitingConnectionError(
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
class _AwaitingConnectionView extends StatelessWidget {
  const _AwaitingConnectionView({required this.onCancelPressed});

  /// Коллбэк отмены
  final VoidCallback onCancelPressed;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return AlertDialog(
      title: Text('Ожидание подключения...', textAlign: TextAlign.center),
      content: SizedBox(
        width: screenSize.width * AwaitingConnectionDialog.widthFraction,
        height: screenSize.height * AwaitingConnectionDialog.heightFraction,
        child: Column(
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
class _AwaitingConnectionError extends StatelessWidget {
  const _AwaitingConnectionError({required this.onCancelPressed, this.message});

  /// Коллбэк отмены
  final VoidCallback onCancelPressed;

  /// Сообщение об ошибке
  final String? message;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return AlertDialog(
      title: Text('Ошибка ожидания подключения!', textAlign: TextAlign.center),
      content: SizedBox(
        width: screenSize.width * AwaitingConnectionDialog.widthFraction,
        height: screenSize.height * AwaitingConnectionDialog.heightFraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(padding: EdgeInsets.only(bottom: 16), child: CommonError()),
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
