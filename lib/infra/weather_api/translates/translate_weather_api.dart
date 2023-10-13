import 'package:weather_forecast/domain/models/weather_model.dart';
import 'package:weather_forecast/infra/infra_generic/infra_base_translate.dart';
import 'package:weather_forecast/infra/weather_api/models/weather_api_weather_response.dart';

class TranslateWeatherApi extends InfraBaseTranslate<WeatherModel, WeatherApiWeatherResponse> {
  @override
  WeatherModel toEntity(response) {
    return WeatherModel(
      summary: response.weather!.main!,
      description: response.weather?.description,
      icon: response.weather?.icon,
      temperatureCurrent: response.main!.temp!,
      temperatureCurrentFeelsLike: response.main!.feelsLike!,
      temperatureMin: response.main!.tempMin!,
      temperatureMax: response.main!.tempMax!,
    );
  }
}
