import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

abstract class INavigation {
  final List<INavigationPage> pages;
  final dynamic navigatorKey;
  INavigation({@required this.pages, @required this.navigatorKey});

  bool checkActiveRoute();
  Future<T> navigateTo<T extends Object>(String pageName, {Object arguments});
  void backNavegation<T extends Object>([T result]);
  Future<T> resetNavigationAndNavigateTo<T extends Object>(String pageName, {Object arguments});
  void backNavigationUntil(String pageName);
}

abstract class INavigationPage<T> {
  final String route;
  dynamic get page;
  INavigationPage(this.route);
}
