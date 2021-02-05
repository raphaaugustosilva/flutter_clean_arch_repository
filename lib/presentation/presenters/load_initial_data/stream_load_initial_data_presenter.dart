import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';

import 'package:get_it/get_it.dart';
import 'package:poc_flutter_clean_repository/app/factories/utils/app_config/make_app_config_factory.dart';
import 'package:poc_flutter_clean_repository/app/utils/app_config/app_config.dart';

import '../interfaces.dart';
import '../../ui/utils/utils.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/config/i_load_config.dart';

class LoadInitialDataState {}

class StreamLoadInitialDataPresenter implements ILoadInitialDataPresenter {
  final INavigation _navigation = GetIt.instance.get<INavigation>();
  final ILoadConfig loadConfig;

  var _controller = StreamController<LoadInitialDataState>.broadcast();

  StreamLoadInitialDataPresenter({@required this.loadConfig});

  void dispose() {
    _controller?.close();
    _controller = null;
  }

  @override
  Future<void> loadData() async {
    await Future.delayed(Duration(seconds: 2));
    print("Entrou no load data do Stream");

    try {
      //final account = await loadCurrentUser.load();
      final account = null;

      await loadConfig.load();
      await initAppConfig();

      goToInitialPage(userAlreadyLoggedId: account?.id != null);
    } catch (e) {}
  }

  Future<void> initAppConfig() async {
    //Init/load the complete app config
    AppConfig appConfig = makeAppConfig();
    await appConfig.init();
    print(appConfig.toString());
    GetIt.instance.registerSingleton<AppConfig>(appConfig);
  }

  @override
  void goToInitialPage({@required bool userAlreadyLoggedId}) {
    String route = userAlreadyLoggedId == true ? NavigationRoutes.orderList : NavigationRoutes.orderList;
    _navigation.resetNavigationAndNavigateTo(route);
  }
}
