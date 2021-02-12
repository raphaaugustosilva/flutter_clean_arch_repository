import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get_it/get_it.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:poc_flutter_clean_repository/app/di/di.dart';
import 'package:poc_flutter_clean_repository/utils/connection_monitor/i_connection_monitor.dart';
import 'package:poc_flutter_clean_repository/presentation/ui/theme/theme.dart';
import 'package:poc_flutter_clean_repository/presentation/ui/utils/utils.dart';

void main() async {
  await _initializeFirebase();
  await configureInjection();
  runApp(App());

  GetIt.instance.get<IConnectionMonitor>().init(); //Initialize the connection monitor
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
        initialRoute: NavigationRoutes.root,
        onGenerateRoute: navigation.pagesRouteFactory(),
      ),
    );
  }
}
