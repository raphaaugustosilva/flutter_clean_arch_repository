import 'package:flutter/material.dart';
import 'package:weather_forecast/app/navigator/i_navigation.dart';
import 'package:weather_forecast/app/utils/extensions/iterable_extension.dart';
import 'package:weather_forecast/app/navigator/exceptions/navigation_exceptions.dart';

class NavigationPage<T extends Object> extends INavigationPage<T> {
  NavigationPage(String route, {Object? arguments, required Widget Function(BuildContext) builder}) : super(route, arguments: arguments, builder: builder);
}

class Navigation implements INavigation {
  @override
  final List<INavigationPage> pages;

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  Navigation.init({required this.pages, required this.navigatorKey});

  @override
  RouteFactory? pagesRouteFactory() {
    try {
      return (settings) {
        String? routeName = settings.name;
        Object? arguments = settings.arguments;
        INavigationPage? navigationPage = pages.firstWhereOrNull((e) => e.route == (routeName ?? ""));
        if (navigationPage == null) throw NavigationException(message: "Page $routeName not founded or registered at pages List<INavigationPage>");

        return MaterialPageRoute(
          settings: RouteSettings(name: routeName, arguments: arguments),
          builder: navigationPage.builder,
        );
      };
    } catch (e) {
      throw NavigationException(innerException: e, message: "Error at pagesRouteFactory");
    }
  }

  @override
  bool checkActiveRoute(BuildContext? context) {
    try {
      if (context == null) return false;
      return ModalRoute.of(context)?.isCurrent ?? false;
    } catch (e) {
      return false; //Se dar catch não precisamos logar nem passar para frente, pois o contexto não está mais válido e logo, a rota não está ativa (por isso setando false)
    }
  }

  @override
  Future<T?> navigateTo<T extends Object?>(String? pageName, {Object? arguments}) {
    return navigatorKey.currentState?.pushNamed(pageName ?? "", arguments: arguments) ?? Future.value(null);
  }

  @override
  void backNavigation<T extends Object?>([T? result]) {
    return navigatorKey.currentState?.pop(result);
  }

  @override
  Future<T?> resetNavigationAndNavigateTo<T extends Object?>(String pageName, {Object? arguments}) {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(pageName, (Route<dynamic> route) => false, arguments: arguments) ?? Future.value(null);
  }

  @override
  Future<T?> replaceCurrentPageWith<T extends Object?>(String pageName, {Object? arguments}) {
    return navigatorKey.currentState?.pushReplacementNamed(pageName, arguments: arguments) ?? Future.value(null);
  }

  @override
  void backNavigationUntil(String pageName) {
    return navigatorKey.currentState?.popUntil(ModalRoute.withName(pageName));
  }
}
