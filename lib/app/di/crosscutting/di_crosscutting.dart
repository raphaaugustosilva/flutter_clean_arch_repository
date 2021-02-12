import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'package:poc_flutter_clean_repository/app/di/i_di_feature.dart';
import 'package:poc_flutter_clean_repository/crosscutting/firebase/remote_config/interfaces/i_remote_config_remote.dart';
import 'package:poc_flutter_clean_repository/crosscutting/firebase/remote_config/remote_config_remote.dart';
import 'package:poc_flutter_clean_repository/crosscutting/microservice_xpto/order/add_order_remote.dart';
import 'package:poc_flutter_clean_repository/crosscutting/microservice_xpto/order/interfaces/i_add_order_remote.dart';
import 'package:poc_flutter_clean_repository/crosscutting/microservice_xpto/order/interfaces/i_load_order_remote.dart';
import 'package:poc_flutter_clean_repository/crosscutting/microservice_xpto/order/load_order_remote.dart';
import 'package:poc_flutter_clean_repository/utils/http/http_util.dart';

class DICrosscutting implements IDIFeature {
  @override
  Future<void> configureInjection() async {
    GetIt getIt = GetIt.instance;

    getIt.registerLazySingleton<IRemoteConfigRemote>(() => RemoteConfigRemote());

    getIt.registerLazySingleton<ILoadOrderRemote>(() => LoadOrderRemote(
          url: makeApiUrl("orders"),
          httpClient: getIt.get<http.Client>(),
        ));

    getIt.registerLazySingleton<IAddOrderRemote>(() => AddRemote());
  }
}
