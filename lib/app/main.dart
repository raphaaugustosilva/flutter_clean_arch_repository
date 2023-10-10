import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_forecast/app/di/di.dart';
import 'package:weather_forecast/app/bweather_app.dart';
import 'package:weather_forecast/app/environment/environment.dart';
import 'package:weather_forecast/app/environment/base_config/i_env_base_config.dart';

Future<void> main() async {
  BindingBase.debugZoneErrorsAreFatal;
  WidgetsFlutterBinding.ensureInitialized();

  await _initEnvironment();
  await configureInjection();

  runApp(
    BWeatherApp(environment: GetIt.I.get<IEnvBaseConfig>()),
  );
}

Future<void> _initEnvironment() async {
  String environmentNameEnv = const String.fromEnvironment('ENVIRONMENT');
  String urlApiEnv = const String.fromEnvironment('URL_API');
  String apiClientIdEnv = const String.fromEnvironment('API_CLIENT_ID');

  Environment.instance.initConfig(
    environment: environmentNameEnv.getEnvType(),
    urlApi: urlApiEnv,
    apiClientId: apiClientIdEnv,
  );
}
