import 'package:flutter/material.dart';
import 'package:poc_flutter_clean_repository/presentation/ui/theme/theme.dart';

class AppButtonTheme {
  static ButtonStyle makeButtonStylePrimary({TextStyle textStyle}) {
    ButtonStyle buttonStyle = TextButton.styleFrom(
      backgroundColor: AppThemeColors.yellow,
      primary: AppThemeColors.white,
      onSurface: AppThemeColors.brownLight, //Text color when the button is disabled
      minimumSize: Size(88, 52),
      textStyle: textStyle ?? null,
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
    ).copyWith(
      backgroundColor: _setButtonBackgroundColor(enabledColor: AppThemeColors.yellow, disabledColor: AppThemeColors.yellowDisabled),
      overlayColor: _setButtonOverlayColor(enabledColor: AppThemeColors.brown),
    );

    return buttonStyle;
  }

  static ButtonStyle makeButtonStyleLight() {
    return makeButtonStylePrimary(textStyle: AppTextTheme.buttonLabel().copyWith(fontFamily: "CircularStd-Medium", fontSize: 16)).copyWith(
      foregroundColor: _setButtonBackgroundColor(enabledColor: AppThemeColors.brownDark.withOpacity(0.6), disabledColor: AppThemeColors.greyDark),
      backgroundColor: _setButtonBackgroundColor(enabledColor: AppThemeColors.grey, disabledColor: AppThemeColors.grey),
      overlayColor: _setButtonOverlayColor(enabledColor: AppThemeColors.greyDark),
    );
  }

  static ButtonStyle makeButtonStyleSecondary({Color textColor, Color borderColor, Color borderDisabledColor, Color overlayColor}) {
    ButtonStyle buttonStyle = TextButton.styleFrom(
      primary: textColor ?? AppThemeColors.white,
      backgroundColor: Colors.transparent,
      onSurface: AppThemeColors.brownLight, //Text color when the button is disabled
      minimumSize: Size(88, 52),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
    ).copyWith(
      backgroundColor: _setButtonBackgroundColor(enabledColor: Colors.transparent, disabledColor: Colors.transparent),
      overlayColor: _setButtonOverlayColor(enabledColor: overlayColor ?? AppThemeColors.yellow),
      side: _setButtonBorderSide(enabledColor: borderColor ?? AppThemeColors.white, disabledColor: borderDisabledColor ?? AppThemeColors.brownLight, borderWidth: 1), //Border
    );

    return buttonStyle;
  }

  static MaterialStateProperty<Color> _setButtonBackgroundColor({@required Color enabledColor, @required Color disabledColor}) {
    return MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) return disabledColor;
      return enabledColor;
    });
  }

  static MaterialStateProperty<Color> _setButtonOverlayColor({@required Color enabledColor}) {
    return MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      if (states.contains(MaterialState.focused)) return enabledColor;
      if (states.contains(MaterialState.hovered)) return enabledColor;
      if (states.contains(MaterialState.pressed)) return enabledColor;
      return null; // Defer to the button theme's default.
    });
  }

  static MaterialStateProperty<BorderSide> _setButtonBorderSide({@required Color enabledColor, @required Color disabledColor, @required double borderWidth}) {
    Color color;
    return MaterialStateProperty.resolveWith<BorderSide>((Set<MaterialState> states) {
      color = (states.contains(MaterialState.disabled)) ? disabledColor : enabledColor;
      return BorderSide(color: color, width: borderWidth);
    });
  }
}
