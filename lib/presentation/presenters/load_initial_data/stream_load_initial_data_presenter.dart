import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';

import 'package:get_it/get_it.dart';

import '../interfaces.dart';
import '../../ui/utils/utils.dart';
import 'package:poc_flutter_clean_repository/data/repositories/repositories.dart';
import 'package:poc_flutter_clean_repository/app/utils/app_config/app_config.dart';
import 'package:poc_flutter_clean_repository/app/utils/app_config/config_keys.dart';
import 'package:poc_flutter_clean_repository/app/utils/app_config/local_config_secrets.dart';

class LoadInitialDataState {}

class StreamLoadInitialDataPresenter implements ILoadInitialDataPresenter {
  final AppConfig _appConfig = GetIt.instance.get<AppConfig>();
  final INavigation _navigation = GetIt.instance.get<INavigation>();
  final ISecureDataRepository secureDataRepository;
  final IRemoteConfigRepository remoteConfigRepository;

  var _controller = StreamController<LoadInitialDataState>.broadcast();

  StreamLoadInitialDataPresenter({@required this.secureDataRepository, @required this.remoteConfigRepository});

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

      await fetchAppConfigurations();

      goToInitialPage(userAlreadyLoggedId: account?.id != null);
    } catch (e) {}
  }

  @override
  void goToInitialPage({@required bool userAlreadyLoggedId}) {
    String route = userAlreadyLoggedId == true ? NavigationRoutes.orderList : NavigationRoutes.orderList;
    _navigation.resetNavigationAndNavigateTo(route);
  }

  Future fetchAppConfigurations() async {
    try {
      Map<String, String> mapConfigsKeyValue = Map<String, String>();

      //If is release mode, then the secret will be fetched from Firebase Remote Config.
      if (kReleaseMode) {
        //Instantiate and prepare Firebase Remote Config
        await remoteConfigRepository.init(true);

        for (String key in ConfigKeys.keys) {
          //Search for the key`s value from Firebase Remote Config
          mapConfigsKeyValue[key] = await remoteConfigRepository.getSecretFromKey(key);
        }
      } else {
        //Otherwise, It`ll be fetched from developer local file.
        ConfigKeys.keys.forEach((key) {
          mapConfigsKeyValue[key] = LocalConfigSecrets.secrets()[key];
        });
      }

      //Now stores in the device`s secure area (keystore and keychain)
      await secureDataRepository.deleteAll();
      await secureDataRepository.storeMap(mapConfigsKeyValue);

      //Init/load the complete app config
      await _appConfig.init();

      print(_appConfig.toString());
    } catch (e) {
      print("Erro ao recuperar as configurações seguras do app. Detalhes: $e");
    }
  }
}
