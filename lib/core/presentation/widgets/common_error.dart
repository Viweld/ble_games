import 'package:batuga/core/resources/app_animations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CommonError extends StatelessWidget {
  const CommonError({this.size = 200, super.key});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      AppAnimations.error,
      width: size,
      height: size,
      fit: BoxFit.contain,
      repeat: false,
    );
  }
}
