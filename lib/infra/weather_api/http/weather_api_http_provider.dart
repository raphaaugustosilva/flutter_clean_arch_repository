import 'package:weather_forecast/infra/http/dio_http_provider.dart';
import 'package:weather_forecast/app/environment/base_config/i_env_base_config.dart';
import 'package:weather_forecast/infra/weather_api/http/i_weather_api_http_provider.dart';

class WeatherApiHttpProvider extends DioHttpProvider implements IWeatherApiHttpProvider {
  @override
  final IEnvBaseConfig environment;
  WeatherApiHttpProvider({required this.environment});

  @override
  Map<String, dynamic> queryParametersBase() {
    return {
      "appid": environment.apiKey,
      "units": "imperial",
    };
  }

  @override
  Map<String, dynamic> queryParametersLatLong({required double lat, required double long}) {
    return {
      "lat": lat,
      "lon": long,
    };
  }
}
