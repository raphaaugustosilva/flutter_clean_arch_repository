import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class GeneralWidgetTestsSetup {
  static Future<void> initializeComponent(WidgetTester tester, Widget widgetToTest) async {
    // Create the widget by telling the tester to build it
    await tester.pumpWidget(
      MaterialApp(
        title: 'Flutter Widget Tests',
        home: Scaffold(
          body: widgetToTest,
        ),
      ),
    );
  }
}
