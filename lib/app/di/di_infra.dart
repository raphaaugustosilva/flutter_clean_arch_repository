import 'package:get_it/get_it.dart';
import 'package:weather_forecast/app/di/i_di_feature.dart';
import 'package:weather_forecast/infra/weather_api/weather_api.dart';
import 'package:weather_forecast/infra/weather_api/i_weather_api.dart';
import 'package:weather_forecast/app/environment/base_config/i_env_base_config.dart';
import 'package:weather_forecast/domain/infra/repositories/i_concert_repository.dart';
import 'package:weather_forecast/infra/weather_api/http/weather_api_http_provider.dart';
import 'package:weather_forecast/infra/weather_api/http/i_weather_api_http_provider.dart';
import 'package:weather_forecast/infra/repositories/local_storage/concert_repository.dart';

class DIInfra implements IDIFeature {
  @override
  Future<void> configureInjection() async {
    GetIt getIt = GetIt.instance;

    getIt.registerLazySingleton<IConcertRepository>(() => ConcertRepository());

    getIt.registerLazySingleton<IWeatherApiHttpProvider>(() => WeatherApiHttpProvider(
          environment: getIt.get<IEnvBaseConfig>(),
        ));

    getIt.registerLazySingleton<IWeatherApi>(() => WeatherApi(
          httpProvider: getIt.get<IWeatherApiHttpProvider>(),
        ));
  }
}
