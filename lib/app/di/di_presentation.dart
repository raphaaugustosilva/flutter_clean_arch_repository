import 'package:get_it/get_it.dart';
import 'package:weather_forecast/app/di/i_di_feature.dart';
import 'package:weather_forecast/app/navigator/i_navigation.dart';
import 'package:weather_forecast/presentation/presenters/home/home_presenter.dart';
import 'package:weather_forecast/presentation/presenters/splash/splash_presenter.dart';
import 'package:weather_forecast/presentation/presenters/weather/weather_presenter.dart';
import 'package:weather_forecast/domain/services/usecases/concert/i_concert_get_all_use_case.dart';
import 'package:weather_forecast/domain/services/usecases/weather/i_weather_current_get_use_case.dart';
import 'package:weather_forecast/domain/services/usecases/weather/i_weather_forecast_get_use_case.dart';
import 'package:weather_forecast/domain/services/usecases/initial_app_core_services/i_initial_app_transparency_use_case.dart';
import 'package:weather_forecast/domain/services/usecases/initial_app_core_services/i_initial_app_core_services_use_case.dart';

class DIPresentation implements IDIFeature {
  @override
  Future<void> configureInjection() async {
    GetIt getIt = GetIt.instance;

    getIt.registerFactory<SplashPresenter>(() => SplashPresenter(
          navigation: getIt.get<INavigation>(),
          initialAppCoreServicesUseCase: getIt.get<IInitialAppCoreServicesUseCase>(),
          initialAppTransparencyUseCase: getIt.get<IInitialAppTransparencyUseCase>(),
        ));

    getIt.registerFactory<HomePresenter>(() => HomePresenter(
          navigation: getIt.get<INavigation>(),
          concertGetAllUseCase: getIt.get<IConcertGetAllUseCase>(),
        ));

    getIt.registerFactory<WeatherPresenter>(() => WeatherPresenter(
          weatherCurrentGetUseCase: getIt.get<IWeatherCurrentGetUseCase>(),
          weatherForecastGetUseCase: getIt.get<IWeatherForecastGetUseCase>(),
        ));
  }
}
