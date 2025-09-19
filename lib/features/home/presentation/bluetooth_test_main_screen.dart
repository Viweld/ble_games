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
    print('[DEBUG] _BluetoothTestMainView.build() вызван');

    return BlocConsumer<HomeBloc, HomeState>(
      listenWhen: (previous, state) {
        print(
          '[DEBUG] listenWhen: previous=${previous.runtimeType}, state=${state.runtimeType}',
        );
        return false; // Не обрабатываем события здесь
      },
      buildWhen: (previous, state) {
        print(
          '[DEBUG] buildWhen: previous=${previous.runtimeType}, state=${state.runtimeType}',
        );
        return true; // Строим для всех состояний
      },
      listener: (context, state) {
        print('[DEBUG] listener: state=${state.runtimeType}');
      },
      builder: (context, state) {
        print('[DEBUG] builder: state=${state.runtimeType}');

        // Определяем, какой экран показывать в зависимости от состояния
        if (state is HomeStateMessageTestView ||
            state is HomeStateMessageReceived ||
            state is HomeStateMessageSent ||
            state is HomeStateConnectionError) {
          print('[DEBUG] Отображение MessageTestScreen');
          return const MessageTestScreen();
        } else {
          print('[DEBUG] Отображение BluetoothTestScreen');
          return const BluetoothTestScreen();
        }
      },
    );
  }
}
