import 'package:flutter/material.dart';

class KeyboardManager {
  void hideKeyboard(BuildContext context) {
    final currectFocus = FocusScope.of(context);
    if (!currectFocus.hasPrimaryFocus) {
      WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
    }
  }
}
