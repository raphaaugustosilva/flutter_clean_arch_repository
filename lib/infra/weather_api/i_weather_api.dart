import 'package:weather_forecast/infra/weather_api/models/weather_api_weather_response.dart';

abstract interface class IWeatherApi {
  Future<WeatherApiWeatherResponse?> getCurrentWeather({required double lat, required double long});
  Future<List<WeatherApiWeatherResponse>?> getForecastWeather({required double lat, required double long});
}
