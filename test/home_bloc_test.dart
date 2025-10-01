import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:bloc_test/bloc_test.dart';
import 'home_bloc_test.mocks.dart';

import 'package:batuga/core/domain/services/i_bluetooth_service.dart';
import 'package:batuga/core/domain/repositories/i_user_repository.dart';
import 'package:batuga/core/domain/models/user.dart';
import 'package:batuga/core/domain/models/device.dart';
import 'package:batuga/features/home/presentation/bloc/home_bloc.dart';
import 'package:batuga/core/domain/models/messages.dart';

// Генерация моков
@GenerateMocks([IBluetoothService, IUserRepository])
void main() {
  group('HomeBloc', () {
    late MockIBluetoothRepository mockBluetoothRepository;
    late MockIUserRepository mockUserRepository;

    setUp(() {
      mockBluetoothRepository = MockIBluetoothRepository();
      mockUserRepository = MockIUserRepository();

      // Настройка моков
      when(
        mockUserRepository.getCurrentUser(),
      ).thenAnswer((_) async => const User(id: 'test_user', name: 'Test User'));

      // Stub the streams to prevent automatic emissions
      when(
        mockBluetoothRepository.discoveredDevices,
      ).thenAnswer((_) => const Stream.empty());
      when(
        mockBluetoothRepository.incomingMessages,
      ).thenAnswer((_) => const Stream.empty());
      when(
        mockBluetoothRepository.clientConnections,
      ).thenAnswer((_) => const Stream.empty());
    });

    test('начальное состояние', () {
      final homeBloc = HomeBloc(
        playerRepository: mockUserRepository,
        bluetoothRepository: mockBluetoothRepository,
      );

      expect(homeBloc.state, const HomeState.initializationPending());

      // Close the bloc to prevent memory leaks
      homeBloc.close();
    });

    blocTest<HomeBloc, HomeState>(
      'успешная инициализация',
      build: () => HomeBloc(
        playerRepository: mockUserRepository,
        bluetoothRepository: mockBluetoothRepository,
      ),
      act: (bloc) => bloc.add(const HomeEvent.onInitializationRequested()),
      // We expect the final state to be view, as initialization completes
      expect: () => const <HomeState>[HomeState.view()],
      verify: (bloc) {
        // Close the bloc after test
        bloc.close();
      },
    );

    blocTest<HomeBloc, HomeState>(
      'ошибка инициализации',
      build: () {
        when(
          mockUserRepository.getCurrentUser(),
        ).thenThrow(Exception('Ошибка инициализации'));

        return HomeBloc(
          playerRepository: mockUserRepository,
          bluetoothRepository: mockBluetoothRepository,
        );
      },
      act: (bloc) => bloc.add(const HomeEvent.onInitializationRequested()),
      expect: () => const <HomeState>[
        HomeState.initializationError(
          message: 'Exception: Ошибка инициализации',
        ),
      ],
      verify: (bloc) {
        // Close the bloc after test
        bloc.close();
      },
    );
  });
}
