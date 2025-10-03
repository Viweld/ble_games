import 'package:batuga/core/di/builders.dep_gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/widgets/common_awaiting.dart';
import '../../../../../core/presentation/widgets/common_error.dart';
import 'bloc/awaiting_connection_bloc.dart';

/// Диалог ввода псевдонима
class AwaitingConnectionDialog extends StatelessWidget {
  const AwaitingConnectionDialog._();

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
          AwaitingConnectionStateView() => const _AwaitingConnectionView(),
          AwaitingConnectionStateError(:final message) =>
            _AwaitingConnectionError(message: message),
          _ => throw UnsupportedError('${state.runtimeType} нельзя строить'),
        },
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
/// Ожидание подключения
class _AwaitingConnectionView extends StatelessWidget {
  const _AwaitingConnectionView();

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text('Ожидание подключения...', textAlign: TextAlign.center),
      content: Column(
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
      actions: [],
    );
  }
}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
/// Ошибка ожидания подключения
class _AwaitingConnectionError extends StatelessWidget {
  const _AwaitingConnectionError({this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Ошибка ожидания подключения!', textAlign: TextAlign.center),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(padding: EdgeInsets.only(bottom: 16), child: CommonError()),
          if (message != null) Text(message!, textAlign: TextAlign.center),
        ],
      ),
      actions: [],
    );
  }
}
