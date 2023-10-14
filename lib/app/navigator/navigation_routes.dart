import 'package:flutter/widgets.dart';
import 'package:weather_forecast/presentation/ui/pages/home/home_page.dart';
import 'package:weather_forecast/app/utils/extensions/iterable_extension.dart';
import 'package:weather_forecast/presentation/ui/pages/splash/splash_page.dart';
import 'package:weather_forecast/presentation/ui/pages/weather/weather_page.dart';

class NavigationRoutes {
  static Object? routeArguments(BuildContext context) {
    return ModalRoute.of(context)?.settings.arguments;
  }

  static String initialRoute = "/";

  static Map<String, Widget Function(BuildContext)> routes = {for (_RouteItem routeItem in _allRoutesList) routeItem.routeName: routeItem.pageBuilder};
  static List<({String routeName, String formattedName, bool removeFromAnalytics})> routesForAnalytics = {for (_RouteItem routeItem in _allRoutesList) (routeName: routeItem.routeName, formattedName: routeItem.routeFormattedName, removeFromAnalytics: routeItem.removeFromAnalyticsScreenTracker)}.toList();

  static String? viewFormattedName(String? routeName) => routesForAnalytics.firstWhereOrNull((e) => e.routeName == routeName)?.formattedName ?? routeName;
  static bool isViewTrackeByAnalytics(String? routeName) => routesForAnalytics.firstWhereOrNull((e) => e.routeName == routeName)?.removeFromAnalytics == false;

  static final List<_RouteItem> _allRoutesList = [
    _RouteItem(SplashPage.route, "splash", (BuildContext context) => SplashPage(), removeFromAnalyticsScreenTracker: true),
    _RouteItem(HomePage.route, "home", (context) => const HomePage()),
    _RouteItem(WeatherPage.route, "weather", (context) => WeatherPage(arguments: ModalRoute.of(context)?.settings.arguments as WeatherPageArgs)),
  ];

  static void addRoutesForAnalyticsList(List<({String routeName, String formattedName, bool removeFromAnalytics})> routeForAnalyticsList) => routesForAnalytics.addAll(routeForAnalyticsList);
}

class _RouteItem {
  final String routeName;
  final String routeFormattedName;
  final Widget Function(BuildContext) pageBuilder;
  final bool removeFromAnalyticsScreenTracker;

  _RouteItem(this.routeName, this.routeFormattedName, this.pageBuilder, {this.removeFromAnalyticsScreenTracker = false});
}
