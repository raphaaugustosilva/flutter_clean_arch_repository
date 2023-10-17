import 'package:flutter/material.dart';
import 'package:weather_forecast/presentation/theme/theme.dart';

class AppThemeButtons {
  ButtonStyle makeButtonStylePrimary({TextStyle? textStyle}) {
    ButtonStyle buttonStyle = TextButton.styleFrom(
      backgroundColor: AppThemeColors.primaryBackground,
      foregroundColor: AppThemeColors.primaryText,
      disabledBackgroundColor: AppThemeColors.primaryBackground.withOpacity(0.3),
      disabledForegroundColor: AppThemeColors.grayLightest,
      iconColor: AppThemeColors.primaryText,
      disabledIconColor: AppThemeColors.gray,
      minimumSize: const Size(0, 50),
      textStyle: textStyle,
    );
    return buttonStyle;
  }

  ButtonStyle makeButtonStyleSecondary({TextStyle? textStyle}) {
    ButtonStyle buttonStyle = TextButton.styleFrom(
      backgroundColor: AppThemeColors.secondary,
      foregroundColor: AppThemeColors.white,
      disabledBackgroundColor: AppThemeColors.grayLight.withOpacity(0.7),
      disabledForegroundColor: AppThemeColors.gray,
      iconColor: AppThemeColors.primaryText,
      disabledIconColor: AppThemeColors.gray,
      minimumSize: const Size(0, 50),
      textStyle: textStyle,
    );
    return buttonStyle;
  }
}
