import 'package:flutter/material.dart';
import 'package:poc_flutter_clean_repository/presentation/ui/theme/theme.dart';

class AppTheme {
  static final EdgeInsets defaultPadding = EdgeInsets.fromLTRB(30, 30, 30, 30);
  static final EdgeInsets defaultPaddingHorizontal = EdgeInsets.only(left: defaultPadding.left, right: defaultPadding.right);
  static final EdgeInsets defaultPaddingVertical = EdgeInsets.only(top: defaultPadding.top, bottom: defaultPadding.bottom);

  static final primaryColor = Colors.orange;
  static final primaryColorDark = AppThemeColors.greyDark;
  static final primaryColorLight = AppThemeColors.yellow;

  static ThemeData makeAppTheme() {
    final textTheme = TextTheme(
      headline1: AppTextTheme.h1(),
      headline2: AppTextTheme.h2(),
      headline3: AppTextTheme.h3(),
      headline5: AppTextTheme.h5(),
      headline4: AppTextTheme.inputLabel(),
      overline: AppTextTheme.h2Plus(),
      caption: AppTextTheme.inputLabel(),
      bodyText1: AppTextTheme.bodyP(),
      button: AppTextTheme.buttonLabel(),
      subtitle1: AppTextTheme.inputText(),
    );

    final inputDecorationTheme = InputDecorationTheme(
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryColorLight)),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
      disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppThemeColors.greyDark)),
      errorBorder: OutlineInputBorder(borderSide: BorderSide(color: AppThemeColors.alert.withOpacity(0.5))),
      focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: AppThemeColors.alert)),
      contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      alignLabelWithHint: true,
    );

    return ThemeData(
      colorScheme: ColorScheme.light(),
      primaryColor: primaryColor,
      primaryColorDark: primaryColorDark,
      primaryColorLight: primaryColorLight,
      accentColor: primaryColor,
      backgroundColor: Colors.white,
      textTheme: textTheme,
      inputDecorationTheme: inputDecorationTheme,
      textButtonTheme: TextButtonThemeData(style: AppButtonTheme.makeButtonStylePrimary()),
      elevatedButtonTheme: ElevatedButtonThemeData(style: AppButtonTheme.makeButtonStylePrimary()),
      outlinedButtonTheme: OutlinedButtonThemeData(style: AppButtonTheme.makeButtonStylePrimary()),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
