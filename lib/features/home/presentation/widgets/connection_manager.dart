import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_bloc.dart';

/// Виджет для управления поиском и сопряжением устройств
class ConnectionManager extends StatelessWidget {
  const ConnectionManager({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return switch (state) {
          HomeStateView(:final isConnected) => _ConnectionControls(
            isConnected: isConnected,
          ),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }
}

/// Элементы управления подключением
class _ConnectionControls extends StatelessWidget {
  final bool isConnected;

  const _ConnectionControls({required this.isConnected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Статус подключения
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isConnected
                ? Colors.green.withValues(alpha: 0.1)
                : Colors.orange.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isConnected ? Colors.green : Colors.orange,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Icon(
                isConnected ? Icons.wifi : Icons.wifi_off,
                color: isConnected ? Colors.green : Colors.orange,
                size: 24,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  isConnected ? 'Подключено к устройству' : 'Не подключено',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: isConnected ? Colors.green : Colors.orange,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Кнопки управления
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              // Кнопка поиска устройств
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    context.read<HomeBloc>().add(
                      const HomeEvent.onSearchDevicesRequested(),
                    );
                  },
                  icon: const Icon(Icons.search),
                  label: const Text('Найти устройства'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // Кнопка рекламы
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    context.read<HomeBloc>().add(
                      const HomeEvent.onStartAdvertisingRequested(),
                    );
                  },
                  icon: const Icon(Icons.broadcast_on_personal),
                  label: const Text('Стать видимым'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Кнопка отключения (если подключены)
        if (isConnected)
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  context.read<HomeBloc>().add(
                    const HomeEvent.onDisconnectRequested(),
                  );
                },
                icon: const Icon(Icons.link_off),
                label: const Text('Отключиться'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  foregroundColor: Colors.red,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
