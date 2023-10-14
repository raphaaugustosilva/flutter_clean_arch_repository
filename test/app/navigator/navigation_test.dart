import 'package:flutter_test/flutter_test.dart';
import 'package:weather_forecast/app/navigator/navigation_routes.dart';
import 'package:weather_forecast/presentation/ui/pages/home/home_page.dart';
import 'package:weather_forecast/presentation/ui/pages/splash/splash_page.dart';
import 'package:weather_forecast/presentation/ui/pages/weather/weather_page.dart';
import 'package:weather_forecast/app/navigator/exceptions/navigation_exceptions.dart';

void main() {
  group('Navigation tests', () {
    test('Navigation Exception toString must return structured message with Inner Exception', () async {
      // Arrange
      NavigationException? navigationException;
      Object? divisinByZeroException;

      // Action
      try {
        1 ~/ 0;
      } catch (e) {
        divisinByZeroException = e;
        navigationException = NavigationException(innerException: e, message: "Test Navigation Exception");
      }

      // Assert
      expect(navigationException.toString(), "NavigationException :\nInnerException: ${divisinByZeroException.toString()}\nError message: Test Navigation Exception");
    });

    test('Method viewFormattedName must return the formatted name', () async {
      // Arrange
      NavigationRoutes();

      // Action
      String? viewFormattedName = NavigationRoutes.viewFormattedName(HomePage.route);

      // Assert
      expect(viewFormattedName, "home");
    });

    test('Method isViewTrackeByAnalytics must return true for pages that are desired to be tracked by Analytics and false for pages that are not', () async {
      // Arrange
      NavigationRoutes();

      // Action
      bool isTrackedByAnalyctics = NavigationRoutes.isViewTrackeByAnalytics(SplashPage.route);

      // Assert
      expect(isTrackedByAnalyctics, false);

      // Action
      isTrackedByAnalyctics = NavigationRoutes.isViewTrackeByAnalytics(HomePage.route);

      // Assert
      expect(isTrackedByAnalyctics, true);

      // Action
      isTrackedByAnalyctics = NavigationRoutes.isViewTrackeByAnalytics(WeatherPage.route);

      // Assert
      expect(isTrackedByAnalyctics, true);
    });
  });
}
