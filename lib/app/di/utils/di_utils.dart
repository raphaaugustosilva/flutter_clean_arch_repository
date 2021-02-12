import 'package:get_it/get_it.dart';

import 'package:http/http.dart' as http;

import 'package:poc_flutter_clean_repository/app/di/i_di_feature.dart';
import 'package:poc_flutter_clean_repository/utils/connection_monitor/connection_monitor.dart';
import 'package:poc_flutter_clean_repository/utils/connection_monitor/i_connection_monitor.dart';

class DIUtils implements IDIFeature {
  GetIt getIt = GetIt.instance;

  @override
  Future<void> configureInjection() async {
    getIt.registerLazySingleton<IConnectionMonitor>(() => ConnectionMonitor());
    getIt.registerLazySingleton<http.Client>(() => http.Client());
  }
}
