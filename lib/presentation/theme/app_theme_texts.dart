import 'package:flutter/material.dart';
import 'package:weather_forecast/presentation/theme/theme.dart';

class AppThemeTexts {
  BuildContext? context;

  void setBuildContext(BuildContext context) => this.context = context;

  AppThemeTexts(this.context);

  TextStyle? title({Color? color}) {
    return Theme.of(context!).textTheme.titleMedium?.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w400,
          color: color ?? AppThemeColors.black,
        );
  }

  TextStyle? titleDetail({Color? color}) {
    return Theme.of(context!).textTheme.titleMedium?.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.w800,
          color: color ?? AppThemeColors.primary,
        );
  }

  TextStyle? subtitle({Color? color}) {
    return Theme.of(context!).textTheme.headlineSmall?.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: color ?? AppThemeColors.gray,
        );
  }

  TextStyle? headingSmall({Color? color}) {
    return Theme.of(context!).textTheme.titleMedium?.copyWith(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
          color: color ?? AppThemeColors.black,
        );
  }

  TextStyle? body({Color? color}) {
    return Theme.of(context!).textTheme.titleMedium?.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: color ?? AppThemeColors.blackLight,
        );
  }
}
