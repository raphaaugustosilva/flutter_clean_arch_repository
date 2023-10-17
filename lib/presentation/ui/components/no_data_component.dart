import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:weather_forecast/presentation/ui/assets/animations/app_animations.dart';

class NoDataComponent extends StatelessWidget {
  const NoDataComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        EAppAnimations.noData.path,
      ),
    );
  }
}
