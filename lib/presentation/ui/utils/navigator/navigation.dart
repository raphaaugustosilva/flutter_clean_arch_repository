import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../ui/utils/navigator/i_navigation.dart';

typedef NavigationPageBuilder = Widget Function();

class NavigationPage<T> extends INavigationPage<T> {
  NavigationPage(String route) : super(route);
  dynamic get page => GetIt.instance.get<T>();
}

class Navigation implements INavigation {
  @override
  final List<INavigationPage> pages;
  final GlobalKey<NavigatorState> navigatorKey;

  Navigation.init({@required this.pages, @required this.navigatorKey});

  RouteFactory pagesRouteFactory() {
    return (settings) {
      String routeName = settings.name;
      dynamic pageWidget = pages?.firstWhere((e) => e.route == routeName, orElse: () => null)?.page;

      return MaterialPageRoute(
        settings: RouteSettings(name: settings.name),
        builder: (BuildContext context) => pageWidget,
      );
    };
  }

  bool checkActiveRoute() {
    try {
      BuildContext _context = this.navigatorKey.currentState.context;
      return ModalRoute.of(_context).isCurrent;
    } catch (e) {
      return false; //Se dar catch nõa precisamos logar nem passar para frente, pois o contexto não está mais válido e logo, a rota não está ativa (por isso setando false)
    }
  }

  Future<T> navigateTo<T extends Object>(String pageName, {Object arguments}) {
    return this.navigatorKey.currentState.pushNamed(pageName, arguments: arguments);
  }

  backNavegation<T extends Object>([T result]) {
    return this.navigatorKey.currentState.pop(result);
  }

  Future<T> resetNavigationAndNavigateTo<T extends Object>(String pageName, {Object arguments}) {
    return this.navigatorKey.currentState.pushNamedAndRemoveUntil(pageName, (Route<dynamic> route) => false, arguments: arguments);
  }

  backNavigationUntil(String pageName) {
    return this.navigatorKey.currentState.popUntil(ModalRoute.withName(pageName));
  }
}
