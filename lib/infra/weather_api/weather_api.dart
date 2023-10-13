import 'dart:convert';
import 'package:weather_forecast/infra/weather_api/i_weather_api.dart';
import 'package:weather_forecast/infra/weather_api/http/i_weather_api_http_provider.dart';
import 'package:weather_forecast/infra/weather_api/models/weather_api_weather_response.dart';

class WeatherApi implements IWeatherApi {
  final IWeatherApiHttpProvider httpProvider;

  WeatherApi({required this.httpProvider});

  @override
  Future<WeatherApiWeatherResponse?> getCurrentWeather({required double lat, required double long}) async {
    final response = await httpProvider.get(
      url: '${httpProvider.environment.baseUrlApi}/data/2.5/weather',
      queryParameters: httpProvider.queryParametersBase()..addAll(httpProvider.queryParametersLatLong(lat: lat, long: long)),
    );

    WeatherApiWeatherResponse responseData = WeatherApiWeatherResponse.fromJson(json.decode(response?.data));
    return responseData;
  }

  @override
  Future<List<WeatherApiWeatherResponse>?> getForecastWeather({required double lat, required double long}) async {
    final response = await httpProvider.get(
      url: '${httpProvider.environment.baseUrlApi}/data/2.5/forecast',
      queryParameters: httpProvider.queryParametersBase()..addAll(httpProvider.queryParametersLatLong(lat: lat, long: long)),
    );

    Map<String, dynamic> responseJson = json.decode(response?.data);
    List<WeatherApiWeatherResponse>? responseData = responseJson['list'] == null ? null : (responseJson['list'] as List<dynamic>).map((e) => WeatherApiWeatherResponse.fromJson(e)).toList();
    return responseData;
  }
}
