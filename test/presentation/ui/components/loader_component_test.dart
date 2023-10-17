import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../setup/general_widget_tests_setup.dart';
import 'package:weather_forecast/presentation/theme/theme.dart';
import 'package:weather_forecast/presentation/ui/components/loader_component.dart';

void main() {
  group("Loader Component Tests", () {
    testWidgets('Ensure correct loading dark color', (WidgetTester tester) async {
      const String key = "load_component_test";

      await GeneralWidgetTestsSetup.initializeComponent(
        tester,
        const LoaderComponent(
          key: Key(key),
          type: ELoaderType.circularLoading,
          style: ELoaderComponentStyle.dark,
        ),
      );

      CircularProgressIndicator circularProgressIndicator = tester.widget(find.byKey(const Key("${key}_circular_progress")).first);
      expect(circularProgressIndicator.color, AppThemeColors.blackLight);
    });

    testWidgets('Ensure correct loading light color', (WidgetTester tester) async {
      const String key = "load_component_test";

      await GeneralWidgetTestsSetup.initializeComponent(
        tester,
        const LoaderComponent(
          key: Key(key),
          type: ELoaderType.circularLoading,
          style: ELoaderComponentStyle.light,
        ),
      );

      CircularProgressIndicator circularProgressIndicator = tester.widget(find.byKey(const Key("${key}_circular_progress")).first);
      expect(circularProgressIndicator.color, AppThemeColors.white);
    });

    testWidgets('Ensure correct widget render according to type parameter', (WidgetTester tester) async {
      const String key = "load_component_test";

      await GeneralWidgetTestsSetup.initializeComponent(
        tester,
        const LoaderComponent(
          key: Key(key),
          type: ELoaderType.circularLoading,
          style: ELoaderComponentStyle.dark,
        ),
      );

      Finder findCircularProgressElement = find.byKey(const Key("${key}_circular_progress"));
      Finder findLottieElement = find.byKey(const Key("${key}_lottie_animation"));
      expect(findCircularProgressElement, findsOneWidget);
      expect(findLottieElement, findsNothing);

      await GeneralWidgetTestsSetup.initializeComponent(
        tester,
        const LoaderComponent(
          key: Key(key),
          type: ELoaderType.animation,
          style: ELoaderComponentStyle.dark,
        ),
      );

      findCircularProgressElement = find.byKey(const Key("${key}_circular_progress"));
      findLottieElement = find.byKey(const Key("${key}_lottie_animation"));
      expect(findCircularProgressElement, findsNothing);
      expect(findLottieElement, findsOneWidget);
    });
  });
}
