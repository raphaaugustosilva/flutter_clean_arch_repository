import 'package:get_it/get_it.dart';
import 'package:weather_forecast/app/di/i_di_feature.dart';
import 'package:weather_forecast/domain/infra/remote_config/i_remote_config.dart';
import 'package:weather_forecast/services/usecases/concert/concert_get_all_use_case.dart';
import 'package:weather_forecast/domain/services/usecases/concert/i_concert_get_all_use_case.dart';
import 'package:weather_forecast/services/usecases/connection/connection_internet_check_use_case.dart';
import 'package:weather_forecast/services/usecases/configurations/configurations_api_set_use_case.dart';
import 'package:weather_forecast/domain/services/usecases/configurations/i_configurations_api_set_use_case.dart';
import 'package:weather_forecast/domain/services/usecases/connection/i_connection_internet_check_use_case.dart';
import 'package:weather_forecast/services/usecases/initial_app_core_services/initial_app_transparency_use_case.dart';
import 'package:weather_forecast/services/usecases/initial_app_core_services/initial_app_core_services_use_case.dart';
import 'package:weather_forecast/domain/services/usecases/initial_app_core_services/i_initial_app_transparency_use_case.dart';
import 'package:weather_forecast/domain/services/usecases/initial_app_core_services/i_initial_app_core_services_use_case.dart';

class DIServices implements IDIFeature {
  @override
  Future<void> configureInjection() async {
    GetIt getIt = GetIt.instance;

    getIt.registerFactory<IConnectionInternetCheckUseCase>(() => ConnectionInternetCheckUseCase());
    getIt.registerFactory<IInitialAppTransparencyUseCase>(() => InitialAppTransparencyUseCase());

    getIt.registerFactory<IInitialAppCoreServicesUseCase>(() => InitialAppCoreServicesUseCase(
          remoteConfig: getIt.get<IRemoteConfig>(),
        ));

    getIt.registerFactory<IConfigurationsApiSetUseCase>(() => ConfigurationsApiSetUseCase(
          remoteConfig: getIt.get<IRemoteConfig>(),
        ));

    getIt.registerFactory<IConcertGetAllUseCase>(() => ConcertGetAllUseCase());
  }
}
