import 'package:flutter/material.dart';

/// Общий индикатор прогресса
class CommonProgressIndicator extends StatelessWidget {
  const CommonProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 24,
      child: const CircularProgressIndicator(),
    );
  }
}
