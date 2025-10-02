import 'package:batuga/core/domain/services/bluetooth_manager/i_bluetooth_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:bloc_test/bloc_test.dart';
import 'home_bloc_test.mocks.dart';

import 'package:batuga/core/domain/repositories/i_user_repository.dart';
import 'package:batuga/core/domain/models/user.dart';
import 'package:batuga/features/home/presentation/bloc/home_bloc.dart';

// Генерация моков
@GenerateMocks([IBluetoothManager, IUserRepository])
void main() {
  group('HomeBloc', () {
    late MockIBluetoothManager mockBluetoothManager;
    late MockIUserRepository mockUserRepository;

    setUp(() {
      mockBluetoothManager = MockIBluetoothManager();
      mockUserRepository = MockIUserRepository();

      // Настройка моков
      when(
        mockUserRepository.getCurrentUser(),
      ).thenAnswer((_) async => const User(id: 'test_user', name: 'Test User'));

      // Stub the streams to prevent automatic emissions
      when(
        mockBluetoothManager.discoveredDevices,
      ).thenAnswer((_) => const Stream.empty());
      when(
        mockBluetoothManager.incomingMessages,
      ).thenAnswer((_) => const Stream.empty());
      when(
        mockBluetoothManager.clientConnections,
      ).thenAnswer((_) => const Stream.empty());
    });

    test('начальное состояние', () {
      final homeBloc = HomeBloc(
        playerRepository: mockUserRepository,
        bluetoothRepository: mockBluetoothManager,
      );

      expect(homeBloc.state, const HomeState.initializationPending());

      // Close the bloc to prevent memory leaks
      homeBloc.close();
    });

    blocTest<HomeBloc, HomeState>(
      'успешная инициализация',
      build: () => HomeBloc(
        playerRepository: mockUserRepository,
        bluetoothRepository: mockBluetoothManager,
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
          bluetoothRepository: mockBluetoothManager,
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
