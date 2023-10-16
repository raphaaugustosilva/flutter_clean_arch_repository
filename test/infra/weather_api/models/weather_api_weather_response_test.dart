// ignore_for_file: unnecessary_type_check

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_forecast/infra/infra_generic/i_infra_response.dart';
import 'package:weather_forecast/infra/weather_api/models/weather_api_weather_response.dart';

void main() {
  group('Weather API Weather Response Test', () {
    test('Ensure that WeatherApiWeatherResponse is IInfraResponse', () async {
      // Arrange
      WeatherApiWeatherResponse weatherApiWeatherResponse = const WeatherApiWeatherResponse(dateTime: null, dateTimeTxt: null, weather: null, main: null);

      // Assert
      expect(weatherApiWeatherResponse is IInfraResponse, true);
    });

    test('Ensure that method fromJson correctly transform Map in instance without errors', () async {
      // Arrange
      Map<String, dynamic> jsonMainMock = {
        "temp": 14,
        "feels_like": 18,
        "temp_min": 8,
        "temp_max": 22,
      };

      List<Map<String, dynamic>> jsonWeatherMock = [
        {
          "id": "1",
          "main": "Rain",
          "description": "It will rain all day long",
          "icon": "50n",
        }
      ];

      Map<String, dynamic> jsonMock = {
        "weather": jsonWeatherMock,
        "main": jsonMainMock,
        "dt": 1697328000,
        "dt_txt": "2023-10-15 09:00:00",
      };

      WeatherApiWeatherResponse weatherApiWeatherResponse = WeatherApiWeatherResponse.fromJson(jsonMock);

      // Assert
      expect(weatherApiWeatherResponse.dateTime, DateTime(2023, 10, 14, 21, 0, 0));
      expect(weatherApiWeatherResponse.dateTimeTxt, "2023-10-15 09:00:00");

      expect(weatherApiWeatherResponse.main, isNotNull);
      expect(weatherApiWeatherResponse.main!.temp, 14);
      expect(weatherApiWeatherResponse.main!.feelsLike, 18);
      expect(weatherApiWeatherResponse.main!.tempMin, 8);
      expect(weatherApiWeatherResponse.main!.tempMax, 22);

      expect(weatherApiWeatherResponse.weather, isNotNull);
      expect(weatherApiWeatherResponse.weather!.id, 1);
      expect(weatherApiWeatherResponse.weather!.main, "Rain");
      expect(weatherApiWeatherResponse.weather!.description, "It will rain all day long");
      expect(weatherApiWeatherResponse.weather!.icon, "50n");
    });
  });
}
