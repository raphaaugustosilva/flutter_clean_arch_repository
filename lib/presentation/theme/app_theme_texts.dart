import 'package:flutter/material.dart';
import 'package:weather_forecast/presentation/theme/theme.dart';

extension XAppUIAppThemeTexts on TextStyle {
  TextStyle get w300 => copyWith(fontWeight: FontWeight.w300);
  TextStyle get w400 => copyWith(fontWeight: FontWeight.w400);
  TextStyle get w500 => copyWith(fontWeight: FontWeight.w500);
  TextStyle get w600 => copyWith(fontWeight: FontWeight.w600);
  TextStyle get w700 => copyWith(fontWeight: FontWeight.w700);
  TextStyle get w800 => copyWith(fontWeight: FontWeight.w800);
}

class AppThemeTexts {
  BuildContext? context;

  void setBuildContext(BuildContext context) => this.context = context;

  AppThemeTexts(this.context);

  TextStyle? title({Color? color}) {
    return Theme.of(context!).textTheme.titleMedium?.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: color ?? AppThemeColors.black,
        );
  }

  TextStyle? titleBig({Color? color}) {
    return Theme.of(context!).textTheme.titleMedium?.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.w800,
          color: color ?? AppThemeColors.primary,
        );
  }

  TextStyle? subtitle({Color? color}) {
    return Theme.of(context!).textTheme.headlineSmall?.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: color ?? AppThemeColors.black,
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

  TextStyle? bodySmall({Color? color}) {
    return Theme.of(context!).textTheme.titleMedium?.copyWith(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          color: color ?? AppThemeColors.black,
        );
  }

  TextStyle? p({Color? color}) {
    return TextStyle(
      color: color ?? AppThemeColors.primaryText,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );
  }
}
