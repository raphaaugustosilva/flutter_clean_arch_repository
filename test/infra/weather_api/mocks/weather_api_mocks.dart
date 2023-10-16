import 'package:weather_forecast/infra/weather_api/models/weather_api_weather_response.dart';

class WeatherApiMocks {
  static WeatherApiWeatherResponse weatherApiWeatherResponse({bool weatherMainValueNull = false}) {
    Map<String, dynamic> jsonMainMock = {
      "temp": 14,
      "feels_like": 18,
      "temp_min": 8,
      "temp_max": 22,
    };

    List<Map<String, dynamic>> jsonWeatherMock = [
      {
        "id": "1",
        "main": weatherMainValueNull ? null : "Rain",
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

    return WeatherApiWeatherResponse.fromJson(jsonMock);
  }
}
