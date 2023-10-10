import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:weather_forecast/app/navigator/navigation.dart';
import 'package:weather_forecast/presentation/theme/theme.dart';
import 'package:weather_forecast/app/navigator/i_navigation.dart';
import 'package:weather_forecast/app/navigator/navigation_routes.dart';
import 'package:weather_forecast/app/environment/base_config/i_env_base_config.dart';

class BWeatherApp extends StatelessWidget {
  final IEnvBaseConfig environment;

  const BWeatherApp({Key? key, required this.environment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (environment.type == EEnvType.prod) {
      return _buildApp(context);
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Banner(
        message: environment.label,
        color: environment.color,
        location: BannerLocation.bottomStart,
        child: _buildApp(context),
      ),
    );
  }

  MaterialApp _buildApp(BuildContext context) {
    final Navigation navigation = GetIt.instance.get<INavigation>() as Navigation;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Band Weather Forecast',
      routes: NavigationRoutes.routes,
      theme: AppTheme.makeAppTheme(context),
      initialRoute: NavigationRoutes.initialRoute,
      navigatorKey: navigation.navigatorKey,
      onGenerateRoute: navigation.pagesRouteFactory(),
    );
  }
}
