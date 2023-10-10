import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:weather_forecast/app/di/i_di_feature.dart';
import 'package:weather_forecast/app/navigator/navigation.dart';
import 'package:weather_forecast/app/navigator/i_navigation.dart';
import 'package:weather_forecast/app/navigator/navigation_routes.dart';
import 'package:weather_forecast/presentation/ui/pages/home/home_page.dart';

class DINavigation implements IDIFeature {
  static Object? routeArguments(BuildContext context) {
    return ModalRoute.of(context)?.settings.arguments;
  }

  @override
  Future<void> configureInjection() async {
    GetIt getIt = GetIt.instance;

    getIt.registerSingletonAsync<INavigation>(
      () async {
        return Navigation.init(
          pages: [
            NavigationPage<HomePage>("/", builder: (_) => const HomePage()),
            NavigationPage<HomePage>(HomePage.route, builder: NavigationRoutes.routes[HomePage.route]!),
          ],
          navigatorKey: GlobalKey<NavigatorState>(),
        );
      },
    );
  }
}
