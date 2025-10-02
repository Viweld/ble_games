import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/models/device.dart';
import '../../../../core/domain/models/user.dart';
import '../../../../core/extensions/build_context_extension.dart';
import '../../../core/di/builders.dep_gen.dart';
import 'bloc/home_bloc.dart';

/// Главный экран приложения
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DepProvider.of(context).buildHomeBloc(),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Крестики-Нолики'), centerTitle: true),
      body: BlocConsumer<HomeBloc, HomeState>(
        listenWhen: (previous, state) => switch (state) {
          HomeStateInitializationError() => true,
          HomeStateInvitationReceived() => true,
          HomeStateInvitationRejected() => true,
          HomeStateConnected() => true,
          _ => false,
        },
        buildWhen: (previous, state) => switch (state) {
          HomeStateInitializationPending() => true,
          HomeStateInitializationError() => true,
          HomeStateView() => true,
          HomeStateAwaitingConnection() => true,
          HomeStateSearchingDevices() => true,
          _ => false,
        },
        listener: (context, state) => switch (state) {
          HomeStateInitializationError(:final message) => context.showSnackBar(
            'Ошибка: $message',
          ),
          HomeStateInvitationReceived(:final invitingUser) =>
            _showInvitationDialog(context, invitingUser),
          HomeStateInvitationRejected(:final rejectedUser) =>
            _showRejectionDialog(context, rejectedUser),
          HomeStateConnected() => Navigator.pushNamed(context, '/games_list'),
          _ => null,
        },
        builder: (context, state) {
          return switch (state) {
            HomeStateInitializationPending() => const Center(
              child: CircularProgressIndicator(),
            ),
            HomeStateInitializationError(:final message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Ошибка: $message'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<HomeBloc>().add(
                        const HomeEvent.onInitializationRequested(),
                      );
                    },
                    child: const Text('Повторить'),
                  ),
                ],
              ),
            ),
            HomeStateView() => _MainView(
              onAwaitConnectionPressed: () =>
                  _onAwaitConnectionPressed(context),
              onSearchDevicesPressed: () => _onSearchDevicesPressed(context),
              onBluetoothTestPressed: () => _onBluetoothTestPressed(context),
            ),
            HomeStateAwaitingConnection() => _AwaitingConnectionView(
              onCancel: () => _onCancelAwaiting(context),
            ),
            HomeStateSearchingDevices(:final devices, :final selectedDevice) =>
              _SearchingDevicesView(
                devices: devices,
                selectedDevice: selectedDevice,
                onDeviceSelected: (device) =>
                    _onDeviceSelected(context, device),
                onConnectPressed: () => _onConnectPressed(context),
                onCancelPressed: () => _onCancelSearching(context),
              ),
            _ => throw UnsupportedError('${state.runtimeType} нельзя строить'),
          };
        },
      ),
    );
  }

  /// Обработчик нажатия кнопки 'Ожидать присоединения'
  void _onAwaitConnectionPressed(BuildContext context) {
    context.read<HomeBloc>().add(const HomeEvent.onStartAwaitingConnection());
  }

  /// Обработчик нажатия кнопки 'Найти и подключиться'
  void _onSearchDevicesPressed(BuildContext context) {
    context.read<HomeBloc>().add(const HomeEvent.onStartSearchingDevices());
  }

  /// Обработчик нажатия кнопки 'Тест Bluetooth'
  void _onBluetoothTestPressed(BuildContext context) {
    Navigator.of(context).pushNamed('/bluetooth_test');
  }

  /// Обработчик отмены ожидания
  void _onCancelAwaiting(BuildContext context) {
    context.read<HomeBloc>().add(const HomeEvent.onCancelAwaiting());
  }

  /// Обработчик отмены поиска
  void _onCancelSearching(BuildContext context) {
    context.read<HomeBloc>().add(const HomeEvent.onCancelSearching());
  }

  /// Обработчик выбора устройства
  void _onDeviceSelected(BuildContext context, Device device) {
    context.read<HomeBloc>().add(HomeEvent.onDeviceSelected(device: device));
  }

  /// Обработчик нажатия кнопки 'Подключиться'
  void _onConnectPressed(BuildContext context) {
    context.read<HomeBloc>().add(const HomeEvent.onConnectToDevice());
  }

  /// Показать диалог приглашения
  void _showInvitationDialog(BuildContext context, User invitingUser) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Приглашение'),
        content: Text('${invitingUser.name} пригласил вас поиграть'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<HomeBloc>().add(
                const HomeEvent.onRejectInvitation(),
              );
            },
            child: const Text('Отмена'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<HomeBloc>().add(
                const HomeEvent.onAcceptInvitation(),
              );
            },
            child: const Text('Начать'),
          ),
        ],
      ),
    );
  }

  /// Показать диалог отказа
  void _showRejectionDialog(BuildContext context, User rejectedUser) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Отказ'),
        content: Text('${rejectedUser.name} отказался играть'),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Ок'),
          ),
        ],
      ),
    );
  }
}

/// Основной вид с тремя кнопками
class _MainView extends StatelessWidget {
  const _MainView({
    required this.onAwaitConnectionPressed,
    required this.onSearchDevicesPressed,
    required this.onBluetoothTestPressed,
  });

  /// Коллбэк нажатия 'Ожидать присоединения'
  final VoidCallback onAwaitConnectionPressed;

  /// Коллбэк нажатия 'Найти и подключиться'
  final VoidCallback onSearchDevicesPressed;

  /// Коллбэк нажатия 'Тест Bluetooth'
  final VoidCallback onBluetoothTestPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.bluetooth, size: 64, color: Colors.blue),
            const SizedBox(height: 32),
            const Text(
              'Выберите режим подключения',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),

            /// Кнопка 'Ожидать присоединения'
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: onAwaitConnectionPressed,
                icon: const Icon(Icons.visibility),
                label: const Text('Ожидать присоединения'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                ),
              ),
            ),
            const SizedBox(height: 16),

            /// Кнопка 'Найти и подключиться'
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: onSearchDevicesPressed,
                icon: const Icon(Icons.search),
                label: const Text('Найти и подключиться'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                ),
              ),
            ),
            const SizedBox(height: 16),

            /// Кнопка 'Тест Bluetooth'
            SizedBox(
              width: double.infinity,
              child: TextButton.icon(
                onPressed: onBluetoothTestPressed,
                icon: const Icon(Icons.science),
                label: const Text('Тест Bluetooth-соединения'),
                style: TextButton.styleFrom(padding: const EdgeInsets.all(16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Вид ожидания подключения
class _AwaitingConnectionView extends StatelessWidget {
  const _AwaitingConnectionView({required this.onCancel});

  /// Коллбэк отмены
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 32),
            const Text(
              'Ожидание подключения...',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              'Ваше устройство видимо для других устройств',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
            ElevatedButton(onPressed: onCancel, child: const Text('Отмена')),
          ],
        ),
      ),
    );
  }
}

/// Вид поиска устройств
class _SearchingDevicesView extends StatelessWidget {
  const _SearchingDevicesView({
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
    return Column(
      children: [
        /// Заголовок
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Найденные устройства',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),

        /// Список устройств
        Expanded(
          child: devices.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
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
                          ? Theme.of(
                              context,
                            ).primaryColor.withValues(alpha: 0.3)
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

        /// Кнопки управления
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
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
        ),
      ],
    );
  }
}
