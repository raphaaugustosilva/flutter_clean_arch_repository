import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get_it/get_it.dart';
import 'package:firebase_core/firebase_core.dart';

import './utils/app_config/app_config.dart';
import 'package:poc_flutter_clean_repository/presentation/ui/theme/theme.dart';
import 'package:poc_flutter_clean_repository/presentation/ui/utils/utils.dart';

import 'factories/pages/load_initial_data_page_factory.dart';
import 'factories/pages/order/order_list_page_factory.dart';
import 'factories/utils/app_config/make_app_config_factory.dart';

void main() async {
  await _initializeFirebase();
  GetIt getIt = GetIt.instance;

  getIt.registerSingleton<INavigation>(Navigation.init(
    pages: [
      NavigationPage(NavigationRoutes.root, makeLoadInitialDataPage),
      NavigationPage(NavigationRoutes.loadInitialData, makeLoadInitialDataPage),
      NavigationPage(NavigationRoutes.orderList, makeOrderListPage),
    ],
    navigatorKey: GlobalKey<NavigatorState>(),
  ));

  getIt.registerSingleton<KeyboardManager>(KeyboardManager());

  //Init/load the complete app config
  AppConfig appConfig = AppConfig();
  await appConfig.init();
  //print(_appConfig.toString());
  getIt.registerSingleton<AppConfig>(appConfig);

  runApp(App());
}

Future<void> _initializeFirebase() async {
  try {
    await Firebase.initializeApp();
  } catch (e) {}
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    final Navigation navigation = GetIt.instance.get<INavigation>();
    final KeyboardManager keyboardManager = GetIt.instance.get<KeyboardManager>();

    return GestureDetector(
      onTap: () => keyboardManager.hideKeyboard(context),
      child: MaterialApp(
        title: 'POC Flutter Clean Arch',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.makeAppTheme(),
        navigatorKey: navigation.navigatorKey,
        initialRoute: NavigationRoutes.loadInitialData,
        onGenerateRoute: navigation.pagesRouteFactory(),
      ),
    );
  }
}
