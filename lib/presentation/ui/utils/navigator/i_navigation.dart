import 'package:meta/meta.dart';

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

abstract class INavigationPage {
  final String route;
  final dynamic page;

  INavigationPage(this.route, this.page);
}
