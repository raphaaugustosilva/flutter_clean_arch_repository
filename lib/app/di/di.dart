import 'package:get_it/get_it.dart';

import 'package:poc_flutter_clean_repository/app/di/domain/di_domain.dart';
import 'package:poc_flutter_clean_repository/app/di/infra/di_infra.dart';
import 'package:poc_flutter_clean_repository/app/di/crosscutting/di_crosscutting.dart';
import 'package:poc_flutter_clean_repository/app/di/services/di_services.dart';
import 'package:poc_flutter_clean_repository/app/di/presentation/di_presentation.dart';
import 'package:poc_flutter_clean_repository/app/di/utils/di_utils.dart';
import 'package:poc_flutter_clean_repository/app/di/app/di_app.dart';

final GetIt getIt = GetIt.instance;

Future<void> configureInjection() async {
  await DIDomain().configureInjection();
  await DIInfra().configureInjection();
  await DICrosscutting().configureInjection();
  await DIServices().configureInjection();
  await DIPresentation().configureInjection();
  await DIUtils().configureInjection();
  await DIApp().configureInjection();

  await getIt.allReady();

  print("FINALIZOU INJEÇÃO DE DEPENDÊNCIA");
}
