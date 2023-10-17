import 'dart:developer';
import 'package:get_it/get_it.dart';
import 'package:weather_forecast/app/di/di_app.dart';
import 'package:weather_forecast/app/di/di_infra.dart';
import 'package:weather_forecast/app/di/di_domain.dart';
import 'package:weather_forecast/app/di/di_services.dart';
import 'package:weather_forecast/app/di/di_navigation.dart';
import 'package:weather_forecast/app/di/di_presentation.dart';

final GetIt getIt = GetIt.instance;

Future<void> configureInjection() async {
  //Dependency registration calls
  await DIApp().configureInjection();
  await DIDomain().configureInjection();
  await DIInfra().configureInjection();
  await DINavigation().configureInjection();
  await DIServices().configureInjection();
  await DIPresentation().configureInjection();

  await getIt.allReady();

  log("FINISHED DEPENDENCY INJECTION");
}
