import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/models/device.dart';
import '../../../../../core/domain/models/messages.dart';
import '../../../../../core/domain/models/user.dart';
import '../../../tictactoe/domain/models/enums/player_type.dart';
import '../bloc/home_bloc.dart';

/// Экран для тестирования Bluetooth-соединения
class BluetoothTestScreen extends StatelessWidget {
  const BluetoothTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('[DEBUG] BluetoothTestScreen.build() вызван');

    return BlocConsumer<HomeBloc, HomeState>(
      listenWhen: (previous, state) {
        final shouldListen = switch (state) {
          HomeStateInitializationError() => true,
          HomeStateInvitationReceived() => true,
          HomeStateInvitationRejected() => true,
          HomeStateGameStarted() => true,
          _ => false,
        };
        print(
          '[DEBUG] BluetoothTestScreen.listenWhen: previous=${previous.runtimeType}, state=${state.runtimeType}, result=$shouldListen',
        );
        return shouldListen;
      },
      buildWhen: (previous, state) {
        final shouldBuild = switch (state) {
          HomeStateInitializationPending() => true,
          HomeStateInitializationError() => true,
          HomeStateView() => true,
          HomeStateAwaitingConnection() => true,
          HomeStateSearchingDevices() => true,
          _ => false,
        };
        print(
          '[DEBUG] BluetoothTestScreen.buildWhen: previous=${previous.runtimeType}, state=${state.runtimeType}, result=$shouldBuild',
        );
        return shouldBuild;
      },
      listener: (context, state) {
        print(
          '[DEBUG] BluetoothTestScreen.listener: state=${state.runtimeType}',
        );
        return switch (state) {
          HomeStateInitializationError(:final message) => _showErrorDialog(
            context,
            'Ошибка инициализации: $message',
          ),
          HomeStateInvitationReceived(:final invitingUser) =>
            _showInvitationDialog(context, invitingUser),
          HomeStateInvitationRejected(:final rejectedUser) =>
            _showRejectionDialog(context, rejectedUser),
          HomeStateGameStarted() => _showConnectionSuccessDialog(context),
          _ => null,
        };
      },
      builder: (context, state) {
        print(
          '[DEBUG] BluetoothTestScreen.builder: state=${state.runtimeType}',
        );

        return switch (state) {
          HomeStateInitializationPending() => const Center(
            child: CircularProgressIndicator(),
          ),
          HomeStateInitializationError(:final message) => _ErrorView(
            message: message,
            onRetry: () {
              context.read<HomeBloc>().add(
                const HomeEvent.onInitializationRequested(),
              );
            },
          ),
          HomeStateView() => _MainTestView(
            onAwaitConnectionPressed: () => _onAwaitConnectionPressed(context),
            onSearchDevicesPressed: () => _onSearchDevicesPressed(context),
          ),
          HomeStateAwaitingConnection() => _AwaitingConnectionView(
            onCancel: () => _onCancelAwaiting(context),
          ),
          HomeStateSearchingDevices(:final devices, :final selectedDevice) =>
            _SearchingDevicesView(
              devices: devices,
              selectedDevice: selectedDevice,
              onDeviceSelected: (device) => _onDeviceSelected(context, device),
              onConnectPressed: () => _onConnectPressed(context),
              onCancelPressed: () => _onCancelSearching(context),
            ),
          _ => throw UnsupportedError('${state.runtimeType} нельзя строить'),
        };
      },
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

  /// Показать диалог ошибки
  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Ошибка'),
        content: Text(message),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Ок'),
          ),
        ],
      ),
    );
  }

  /// Показать диалог приглашения
  void _showInvitationDialog(BuildContext context, User invitingUser) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Приглашение'),
        content: Text('${invitingUser.name} хочет подключиться'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<HomeBloc>().add(
                const HomeEvent.onRejectInvitation(),
              );
            },
            child: const Text('Отклонить'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<HomeBloc>().add(
                const HomeEvent.onAcceptInvitation(),
              );
            },
            child: const Text('Принять'),
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
        content: Text('${rejectedUser.name} отклонил подключение'),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Ок'),
          ),
        ],
      ),
    );
  }

  /// Показать диалог успешного подключения
  void _showConnectionSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Успех'),
        content: const Text('Устройства успешно подключены!'),
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

/// Вид ошибки
class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error, size: 64, color: Colors.red),
          const SizedBox(height: 16),
          Text('Ошибка: $message'),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: onRetry, child: const Text('Повторить')),
        ],
      ),
    );
  }
}

/// Основной вид тестирования
class _MainTestView extends StatelessWidget {
  const _MainTestView({
    required this.onAwaitConnectionPressed,
    required this.onSearchDevicesPressed,
  });

  /// Коллбэк нажатия 'Ожидать присоединения'
  final VoidCallback onAwaitConnectionPressed;

  /// Коллбэк нажатия 'Найти и подключиться'
  final VoidCallback onSearchDevicesPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Тест Bluetooth-соединения'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.bluetooth, size: 64, color: Colors.blue),
              const SizedBox(height: 32),
              const Text(
                'Тестирование Bluetooth-соединения',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Выберите роль устройства:',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              /// Кнопка 'Ожидать присоединения' (сервер)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: onAwaitConnectionPressed,
                  icon: const Icon(Icons.visibility),
                  label: const Text('Быть сервером (ожидать подключения)'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              /// Кнопка 'Найти и подключиться' (клиент)
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: onSearchDevicesPressed,
                  icon: const Icon(Icons.search),
                  label: const Text('Быть клиентом (искать устройства)'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Инструкция:\n'
                '1. На одном устройстве выберите "Быть сервером"\n'
                '2. На другом устройстве выберите "Быть клиентом"\n'
                '3. Клиент будет искать сервер\n'
                '4. Выберите сервер из списка и подключитесь',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Тест Bluetooth-соединения'),
        centerTitle: true,
      ),
      body: Center(
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
              const SizedBox(height: 16),
              const Text(
                'Имя устройства: 🎮BaTuGa',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 48),
              ElevatedButton(onPressed: onCancel, child: const Text('Отмена')),
            ],
          ),
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
    return Scaffold(
      appBar: AppBar(title: const Text('Поиск устройств'), centerTitle: true),
      body: Column(
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
                        SizedBox(height: 8),
                        Text(
                          'Убедитесь, что другое устройство в режиме ожидания',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
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
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
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
      ),
    );
  }
}
