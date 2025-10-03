import 'package:batuga/core/resources/app_animations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CommonAwaiting extends StatelessWidget {
  const CommonAwaiting({this.size = 200, super.key});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      AppAnimations.awaitingConnection,
      width: size,
      height: size,
      fit: BoxFit.contain,
    );
  }
}
