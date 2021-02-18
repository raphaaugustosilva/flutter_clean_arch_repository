import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';

import 'package:get_it/get_it.dart';

import 'package:poc_flutter_clean_repository/domain/repositories/i_secure_data_repository.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/config/i_load_config.dart';
import 'package:poc_flutter_clean_repository/app/utils/app_config/app_config.dart';
import 'package:poc_flutter_clean_repository/presentation/ui/utils/navigator/navigationRoutes.dart';
import 'package:poc_flutter_clean_repository/presentation/ui/utils/navigator/i_navigation.dart';

class LoadInitialDataPresenter {
  final ILoadConfig loadConfig;
  LoadInitialDataPresenter({@required this.loadConfig});

  Future<void> loadData() async {
    await Future.delayed(Duration(seconds: 2));
    print("Entrou no load data do Stream");

    try {
      //final account = await loadCurrentUser.load();
      final account = null;

      await loadConfig.execute();
      await initAppConfig();

      goToInitialPage(userAlreadyLoggedId: account?.id != null);
    } catch (e) {}
  }

  Future<void> initAppConfig() async {
    //Init/load the complete app config
    AppConfig appConfig = AppConfig(secureDataRepository: GetIt.instance.get<ISecureDataRepository>());
    await appConfig.init();
    print(appConfig.toString());
  }

  void goToInitialPage({@required bool userAlreadyLoggedId}) {
    //String route = userAlreadyLoggedId == true ? NavigationRoutes.orderListWithStream : NavigationRoutes.orderListWithStream;
    String route = NavigationRoutes.home;
    final INavigation _navigation = GetIt.instance.get<INavigation>();
    _navigation.resetNavigationAndNavigateTo(route);
  }
}
