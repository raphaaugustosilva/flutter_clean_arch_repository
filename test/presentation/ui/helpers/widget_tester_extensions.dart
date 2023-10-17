import 'package:flutter_test/flutter_test.dart';

extension XWidgetTester on WidgetTester {
  Future<void> multiplePumps(int pumpsQtd, {Duration pumpDuration = const Duration(seconds: 1)}) async {
    for (var i = 1; i <= pumpsQtd; i++) {
      await pump(pumpDuration);
    }
  }
}
