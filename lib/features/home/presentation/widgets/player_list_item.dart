import 'package:flutter/material.dart';

import '../../../../core/domain/models/device.dart';

/// Виджет элемента списка игроков
class PlayerListItem extends StatelessWidget {
  const PlayerListItem({
    super.key,
    required this.device,
    required this.isSelected,
    required this.onTap,
  });

  final Device device;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      color: isSelected ? Theme.of(context).colorScheme.primaryContainer : null,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Text(
            (device.name.isNotEmpty ? device.name[0] : '?').toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                device.name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
            const SizedBox(width: 8),
            if (device.isApp)
              Tooltip(
                message: 'Устройство с приложением',
                child: Icon(
                  Icons.flutter_dash,
                  size: 18,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
          ],
        ),
        subtitle: Text('MAC: ${device.id}'),
        trailing: isSelected
            ? Icon(
                Icons.check_circle,
                color: Theme.of(context).colorScheme.primary,
              )
            : null,
        onTap: onTap,
      ),
    );
  }
}
