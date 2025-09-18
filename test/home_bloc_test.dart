import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:bloc_test/bloc_test.dart';
import 'home_bloc_test.mocks.dart';

import 'package:batuga/core/repositories/i_bluetooth_repository.dart';
import 'package:batuga/core/repositories/i_user_repository.dart';
import 'package:batuga/core/domain/models/user.dart';
import 'package:batuga/features/home/presentation/bloc/home_bloc.dart';
import 'package:batuga/features/home/presentation/bloc/states.dart';
import 'package:batuga/features/home/presentation/bloc/events.dart';

// Генерация моков
@GenerateMocks([IBluetoothRepository, IUserRepository])
void main() {
  group('HomeBloc', () {
    late MockIBluetoothRepository mockBluetoothRepository;
    late MockIUserRepository mockUserRepository;
    late HomeBloc homeBloc;

    setUp(() {
      mockBluetoothRepository = MockIBluetoothRepository();
      mockUserRepository = MockIUserRepository();

      // Настройка моков
      when(
        mockUserRepository.getCurrentUser(),
      ).thenAnswer((_) async => const User(id: 'test_user', name: 'Test User'));

      homeBloc = HomeBloc(
        playerRepository: mockUserRepository,
        bluetoothRepository: mockBluetoothRepository,
      );
    });

    tearDown(() {
      homeBloc.close();
    });

    test('начальное состояние', () {
      expect(homeBloc.state, const HomeState.initializationPending());
    });

    blocTest<HomeBloc, HomeState>(
      'успешная инициализация',
      build: () => homeBloc,
      act: (bloc) => bloc.add(const HomeEvent.onInitializationRequested()),
      expect: () => const <HomeState>[
        HomeState.initializationPending(),
        HomeState.view(),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'ошибка инициализации',
      build: () {
        when(
          mockUserRepository.getCurrentUser(),
        ).thenThrow(Exception('Ошибка инициализации'));
        return homeBloc;
      },
      act: (bloc) => bloc.add(const HomeEvent.onInitializationRequested()),
      expect: () => const <HomeState>[
        HomeState.initializationPending(),
        HomeState.initializationError(
          message: 'Exception: Ошибка инициализации',
        ),
      ],
    );
  });
}
