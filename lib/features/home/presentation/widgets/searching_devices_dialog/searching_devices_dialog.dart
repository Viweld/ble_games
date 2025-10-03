import 'package:batuga/core/di/builders.dep_gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/models/device.dart';
import '../../../../../core/presentation/widgets/common_error.dart';
import 'bloc/searching_devices_bloc.dart';

/// Диалог ввода псевдонима
class SearchingDevicesDialog extends StatelessWidget {
  const SearchingDevicesDialog._();

  static Future<void> show(BuildContext context) => showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (context) => SearchingDevicesDialog._(),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DepProvider.of(context).buildSearchingDevicesBloc(),
      child: BlocConsumer<SearchingDevicesBloc, SearchingDevicesState>(
        listenWhen: (previous, state) => switch (state) {
          SearchingDevicesStateConnected() => true,
          _ => false,
        },
        buildWhen: (previous, state) => switch (state) {
          SearchingDevicesStateView() => true,
          SearchingDevicesStateError() => true,
          _ => false,
        },
        listener: (context, state) => switch (state) {
          SearchingDevicesStateConnected() => Navigator.pop(context),
          _ => null,
        },
        builder: (context, state) => switch (state) {
          SearchingDevicesStateView(:final devices, :final selectedDevice) =>
            _SearchingDevicesView(
              devices: devices,
              selectedDevice: selectedDevice,
              onDeviceSelected: (device) => _onDeviceSelected(context, device),
              onConnectPressed: () => _onConnectPressed(context),
              onCancelPressed: () => _onCancelPressed(context),
            ),
          SearchingDevicesStateError(:final message) => _SearchingDevicesError(
            message: message,
          ),
          _ => throw UnsupportedError('${state.runtimeType} нельзя строить'),
        },
      ),
    );
  }

  /// Обработчик выбора устройства
  void _onDeviceSelected(BuildContext context, Device device) {
    context.read<SearchingDevicesBloc>().add(
      SearchingDevicesEvent.onDeviceSelected(device: device),
    );
  }

  /// Обработчик нажатия кнопки 'Подключиться'
  void _onConnectPressed(BuildContext context) {
    context.read<SearchingDevicesBloc>().add(
      const SearchingDevicesEvent.onConnectToDevice(),
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
    final screenSize = MediaQuery.of(context).size;

    return AlertDialog(
      title: Text('Найденные устройства', textAlign: TextAlign.center),
      content: SizedBox(
        height: screenSize.height * 0.7,
        width: screenSize.width * 0.9,
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
                        ? Theme.of(context).primaryColor.withValues(alpha: 0.3)
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
      actions: [
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
    );
  }
}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
/// Ошибка ожидания подключения
class _SearchingDevicesError extends StatelessWidget {
  const _SearchingDevicesError({this.message});

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
