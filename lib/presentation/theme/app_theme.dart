import 'package:flutter/material.dart';
import 'package:weather_forecast/presentation/theme/theme.dart';

class AppTheme {
  static EdgeInsets defaultScreenPadding = const EdgeInsets.symmetric(vertical: 20, horizontal: 16);

  InputDecoration inputDecorationDefault({
    required BuildContext context,
    required bool hasFocus,
    bool isEnabled = true,
    bool hasError = false,
  }) {
    return InputDecoration(
      fillColor: isEnabled ? AppThemeColors.white : AppThemeColors.grayLightest,
      labelStyle: hasFocus
          ? Theme.of(context).inputDecorationTheme.labelStyle?.copyWith(
                color: AppThemeColors.primary,
                fontWeight: FontWeight.w600,
              )
          : null,
    );
  }

  static ThemeData makeAppTheme(BuildContext context) {
    AppThemeTexts appThemeTexts = AppThemeTexts(context);

    final textTheme = TextTheme(
      headlineSmall: appThemeTexts.headingSmall(),
    );

    final inputDecorationTheme = InputDecorationTheme(
      filled: true,
      labelStyle: appThemeTexts.body(),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          style: BorderStyle.solid,
          color: AppThemeColors.gray,
          width: 1,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          style: BorderStyle.solid,
          color: AppThemeColors.gray,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          style: BorderStyle.solid,
          color: AppThemeColors.blue,
          width: 1,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          style: BorderStyle.solid,
          color: AppThemeColors.gray,
          width: 1,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppThemeColors.redDark),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppThemeColors.red),
      ),
    );

    return ThemeData(
      useMaterial3: true,
      textTheme: textTheme,
      inputDecorationTheme: inputDecorationTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(style: AppThemeButtons().makeButtonStylePrimary()),
      filledButtonTheme: FilledButtonThemeData(style: AppThemeButtons().makeButtonStylePrimary()),
      outlinedButtonTheme: OutlinedButtonThemeData(style: AppThemeButtons().makeButtonStylePrimary()),
      textButtonTheme: TextButtonThemeData(style: AppThemeButtons().makeButtonStylePrimary()),
    );
  }
}
