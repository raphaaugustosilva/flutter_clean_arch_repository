import 'dart:developer';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_forecast/app/di/di.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:weather_forecast/app/bweather_app.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:weather_forecast/app/environment/environment.dart';
import 'package:weather_forecast/app/environment/base_config/i_env_base_config.dart';

Future<void> main() async {
  BindingBase.debugZoneErrorsAreFatal;
  WidgetsFlutterBinding.ensureInitialized();

  await _initEnvironment();
  await _initializeFirebase();
  await configureInjection();

  runApp(
    BWeatherApp(environment: GetIt.I.get<IEnvBaseConfig>()),
  );
}

Future<void> _initEnvironment() async {
  String environmentNameEnv = const String.fromEnvironment('ENVIRONMENT');
  String environmentWeatherApiUrlEnv = const String.fromEnvironment('WEATHER_API_URL');
  String environmentWeatherApiKeyEnv = const String.fromEnvironment('WEATHER_API_KEY');

  Environment.instance.initConfig(
    environment: environmentNameEnv.getEnvType(),
    apiUrl: environmentWeatherApiUrlEnv,
    apiKey: environmentWeatherApiKeyEnv,
  );
}

Future<void> _initializeFirebase() async {
  try {
    await Firebase.initializeApp();

    FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(kReleaseMode);
    FlutterError.onError = (errorDetails) => FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  } catch (_) {
    log("\x1B[31m Error at Firebase initialization \x1B[0m");
  }
}
