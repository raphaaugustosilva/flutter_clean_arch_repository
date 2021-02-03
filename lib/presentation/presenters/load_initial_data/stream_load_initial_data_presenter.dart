import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';

import 'package:get_it/get_it.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/config/i_load_config.dart';

import '../interfaces.dart';
import '../../ui/utils/utils.dart';

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
  Future<void> loadInitialData() async {
    await Future.delayed(Duration(seconds: 2));

    try {
      //final account = await loadCurrentUser.load();
      final account = null;

      await loadConfig.getConfig();

      goToInitialPage(userAlreadyLoggedId: account?.id != null);
    } catch (e) {}
  }

  @override
  void goToInitialPage({@required bool userAlreadyLoggedId}) {
    String route = userAlreadyLoggedId == true ? NavigationRoutes.orderList : NavigationRoutes.orderList;
    _navigation.resetNavigationAndNavigateTo(route);
  }
}
