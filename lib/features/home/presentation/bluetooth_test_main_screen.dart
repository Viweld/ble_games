import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/builders.dep_gen.dart';
import 'bloc/home_bloc.dart';
import 'widgets/bluetooth_test_screen.dart';
import 'widgets/message_test_screen.dart';

/// Главный экран для тестирования Bluetooth-соединения
class BluetoothTestMainScreen extends StatelessWidget {
  const BluetoothTestMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DepProvider.of(context).buildHomeBloc(),
      child: const _BluetoothTestMainView(),
    );
  }
}

class _BluetoothTestMainView extends StatelessWidget {
  const _BluetoothTestMainView();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listenWhen: (previous, state) => false, // Не обрабатываем события здесь
      buildWhen: (previous, state) => true, // Строим для всех состояний
      listener: (context, state) {},
      builder: (context, state) {
        // Определяем, какой экран показывать в зависимости от состояния
        if (state is HomeStateMessageTestView ||
            state is HomeStateMessageReceived ||
            state is HomeStateMessageSent ||
            state is HomeStateConnectionError) {
          return const MessageTestScreen();
        } else {
          return const BluetoothTestScreen();
        }
      },
    );
  }
}
