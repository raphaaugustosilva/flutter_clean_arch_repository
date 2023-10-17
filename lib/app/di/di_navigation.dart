import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:weather_forecast/app/di/i_di_feature.dart';
import 'package:weather_forecast/app/navigator/navigation.dart';
import 'package:weather_forecast/app/navigator/i_navigation.dart';
import 'package:weather_forecast/app/navigator/navigation_routes.dart';
import 'package:weather_forecast/presentation/ui/pages/home/home_page.dart';
import 'package:weather_forecast/presentation/ui/pages/splash/splash_page.dart';
import 'package:weather_forecast/presentation/ui/pages/weather/weather_page.dart';

class DINavigation implements IDIFeature {
  @override
  Future<void> configureInjection() async {
    GetIt getIt = GetIt.instance;

    getIt.registerSingletonAsync<INavigation>(
      () async {
        return Navigation.init(
          pages: [
            NavigationPage<SplashPage>("/", builder: (_) => SplashPage()),
            NavigationPage<SplashPage>(SplashPage.route, builder: NavigationRoutes.routes[SplashPage.route]!),
            NavigationPage<HomePage>(HomePage.route, builder: NavigationRoutes.routes[HomePage.route]!),
            NavigationPage<WeatherPage>(WeatherPage.route, builder: NavigationRoutes.routes[WeatherPage.route]!),
          ],
          navigatorKey: GlobalKey<NavigatorState>(),
        );
      },
    );
  }
}
