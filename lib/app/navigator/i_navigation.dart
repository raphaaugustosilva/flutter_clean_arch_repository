import 'package:flutter/material.dart';

abstract interface class INavigation {
  final List<INavigationPage?>? pages;
  final dynamic navigatorKey;
  INavigation({required this.pages, required this.navigatorKey});
  INavigation.init({required this.pages, required this.navigatorKey});

  RouteFactory? pagesRouteFactory();
  bool checkActiveRoute(BuildContext context);
  Future<T?> navigateTo<T extends Object?>(String? pageName, {Object? arguments});
  void backNavigation<T extends Object?>([T? result]);
  Future<T?> resetNavigationAndNavigateTo<T extends Object?>(String pageName, {Object? arguments});
  Future<T?> replaceCurrentPageWith<T extends Object?>(String pageName, {Object? arguments});
  void backNavigationUntil(String pageName);
}

abstract class INavigationPage<T> {
  final String route;
  final Object? arguments;
  final Widget Function(BuildContext) builder;
  INavigationPage(this.route, {required this.arguments, required this.builder});
}
