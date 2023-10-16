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

  static List<WeatherApiWeatherResponse> weatherApiWeatherListResponse() {
    Map<String, dynamic> jsonMainMock02 = {"temp": 14, "feels_like": 18, "temp_min": 8, "temp_max": 22};
    List<Map<String, dynamic>> jsonWeatherMock02 = [
      {"id": "2", "main": "Fine", "description": "It will be fine all day long", "icon": "50n"}
    ];
    Map<String, dynamic> jsonMock02 = {"weather": jsonWeatherMock02, "main": jsonMainMock02, "dt": 1697468400, "dt_txt": "2023-10-16 12:00:00"};

    Map<String, dynamic> jsonMainMock03 = {"temp": 10, "feels_like": 8, "temp_min": 8, "temp_max": 20};
    List<Map<String, dynamic>> jsonWeatherMock03 = [
      {"id": "3", "main": "Snow", "description": "It will snow all day long", "icon": "50n"}
    ];
    Map<String, dynamic> jsonMock03 = {"weather": jsonWeatherMock03, "main": jsonMainMock03, "dt": 1697641200, "dt_txt": "2023-10-18 12:00:00"};

    Map<String, dynamic> jsonMainMock04 = {"temp": 10, "feels_like": 8, "temp_min": 8, "temp_max": 20};
    List<Map<String, dynamic>> jsonWeatherMock04 = [
      {"id": "3", "main": "Snow", "description": "It will snow all day long", "icon": "50n"}
    ];
    Map<String, dynamic> jsonMock04 = {"weather": jsonWeatherMock04, "main": jsonMainMock04, "dt": 1697662800, "dt_txt": "2023-10-18 18:00:00"};

    return [
      WeatherApiWeatherResponse.fromJson(jsonMock02),
      WeatherApiWeatherResponse.fromJson(jsonMock03),
      WeatherApiWeatherResponse.fromJson(jsonMock04),
    ];
  }
}
