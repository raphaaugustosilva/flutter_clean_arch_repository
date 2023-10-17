import 'package:flutter/material.dart';

class KeyboardManager {
  static void hideKeyboard(BuildContext context) {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
    }
  }
}
