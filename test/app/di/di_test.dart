import 'package:get_it/get_it.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_forecast/app/di/di.dart';
import 'package:weather_forecast/app/environment/base_config/i_env_base_config.dart';
import 'package:weather_forecast/app/environment/environment.dart';
import 'package:weather_forecast/app/navigator/i_navigation.dart';
import 'package:weather_forecast/domain/infra/repositories/i_concert_repository.dart';
import 'package:weather_forecast/domain/services/usecases/concert/i_concert_get_all_use_case.dart';
import 'package:weather_forecast/domain/services/usecases/connection/i_connection_internet_check_use_case.dart';
import 'package:weather_forecast/domain/services/usecases/initial_app_core_services/i_initial_app_transparency_use_case.dart';
import 'package:weather_forecast/domain/services/usecases/weather/i_weather_current_get_use_case.dart';
import 'package:weather_forecast/domain/services/usecases/weather/i_weather_forecast_get_use_case.dart';
import 'package:weather_forecast/infra/weather_api/http/i_weather_api_http_provider.dart';
import 'package:weather_forecast/infra/weather_api/i_weather_api.dart';
import 'package:weather_forecast/presentation/presenters/home/home_presenter.dart';
import 'package:weather_forecast/presentation/presenters/splash/splash_presenter.dart';
import 'package:weather_forecast/presentation/presenters/weather/weather_presenter.dart';

void main() {
  group('Dependency Injectin tests', () {
    test('Ensure that all the dependency are injected inside GetIt', () async {
      // Arrange
      Environment.instance.initConfig(environment: EEnvType.dev, apiUrl: "", apiKey: "");

      // Action
      await configureInjection();

      // Assert
      GetIt getIt = GetIt.instance;
      expect(getIt.isRegistered<IEnvBaseConfig>(), true);
      expect(getIt.isRegistered<IConcertRepository>(), true);
      expect(getIt.isRegistered<IWeatherApiHttpProvider>(), true);
      expect(getIt.isRegistered<IWeatherApi>(), true);
      expect(getIt.isRegistered<INavigation>(), true);
      expect(getIt.isRegistered<IConnectionInternetCheckUseCase>(), true);
      expect(getIt.isRegistered<IInitialAppTransparencyUseCase>(), true);
      expect(getIt.isRegistered<IConcertGetAllUseCase>(), true);
      expect(getIt.isRegistered<IWeatherCurrentGetUseCase>(), true);
      expect(getIt.isRegistered<IWeatherForecastGetUseCase>(), true);
      expect(getIt.isRegistered<SplashPresenter>(), true);
      expect(getIt.isRegistered<HomePresenter>(), true);
      expect(getIt.isRegistered<WeatherPresenter>(), true);
    });
  });
}
