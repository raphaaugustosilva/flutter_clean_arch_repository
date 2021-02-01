import 'package:flutter/material.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextStyle h0({Color color}) => TextStyle(fontFamily: "CircularStd-Black", fontSize: 50, color: color);
  static TextStyle h1({Color color}) => TextStyle(fontFamily: "CircularStd-Black", fontSize: 36, color: color);
  static TextStyle h2({Color color}) => TextStyle(fontFamily: "CircularStd-Black", fontSize: 24, color: color);
  static TextStyle h2Plus({Color color}) => TextStyle(fontFamily: "CircularStd-Black", fontSize: 16, color: color);
  static TextStyle h3({Color color}) => TextStyle(fontFamily: "CircularStd-Bold", fontSize: 14, color: color);
  static TextStyle h5({Color color}) => TextStyle(fontFamily: "CircularStd-Book", fontSize: 16, color: color);
  static TextStyle buttonLabel({Color color}) => TextStyle(fontFamily: "CircularStd-Bold", fontSize: 16, color: color);
  static TextStyle inputLabel({Color color}) => TextStyle(fontFamily: "CircularStd-Book", fontSize: 12, color: color);
  static TextStyle inputText({Color color}) => TextStyle(fontFamily: "CircularStd-Medium", fontSize: 16, color: color);
  static TextStyle bitTitle({Color color}) => TextStyle(fontFamily: "CircularStd-Black", fontSize: 50, color: color);
  static TextStyle message({Color color}) => TextStyle(fontFamily: "CircularStd-Book", fontSize: 14, color: color);
  static TextStyle bodyP({Color color}) => TextStyle(fontFamily: "CircularStd-Book", fontSize: 16, color: color);

  static Paint makeStroke(Color color, {double strokeWidth = 1}) {
    return Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = color;
  }
}
