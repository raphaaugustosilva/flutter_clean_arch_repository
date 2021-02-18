import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'package:poc_flutter_clean_repository/app/di/i_di_feature.dart';
import 'package:poc_flutter_clean_repository/crosscutting/firebase/remote_config/interfaces/i_remote_config_remote.dart';
import 'package:poc_flutter_clean_repository/crosscutting/firebase/remote_config/remote_config_remote.dart';
import 'package:poc_flutter_clean_repository/crosscutting/microservice_xpto/order/interfaces/i_xpto_order.dart';
import 'package:poc_flutter_clean_repository/crosscutting/microservice_xpto/order/services/xpto_order.dart';

class DICrosscutting implements IDIFeature {
  @override
  Future<void> configureInjection() async {
    GetIt getIt = GetIt.instance;

    getIt.registerLazySingleton<IRemoteConfigRemote>(() => RemoteConfigRemote());
    getIt.registerLazySingleton<IXptoOrder>(() => XptoOrder(httpClient: getIt.get<http.Client>()));
  }
}
