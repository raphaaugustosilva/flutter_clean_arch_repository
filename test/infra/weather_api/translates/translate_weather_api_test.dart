import 'package:flutter_test/flutter_test.dart';
import 'package:weather_forecast/domain/models/weather_model.dart';
import 'package:weather_forecast/infra/weather_api/models/weather_api_weather_response.dart';
import 'package:weather_forecast/infra/weather_api/translates/translate_weather_api.dart';

import '../mocks/weather_api_mocks.dart';

void main() {
  group("Translate Weater Api Tests", () {
    test("Ensure that a Weather API Response object is converted to Model without errors", () {
      // Arrange
      TranslateWeatherApi translateWeatherApi = TranslateWeatherApi();
      WeatherApiWeatherResponse response = WeatherApiMocks.weatherApiWeatherResponse();

      // Action
      WeatherModel? weatherModel = translateWeatherApi.toEntity(response);

      // Assert
      expect(weatherModel, isNotNull);
      expect(weatherModel.dateTime, DateTime(2023, 10, 14, 21, 0, 0));

      expect(weatherModel.summary, response.weather?.main);
      expect(weatherModel.description, response.weather?.description);
      expect(weatherModel.icon, response.weather?.icon);
      expect(weatherModel.temperatureCurrent, response.main?.temp);
      expect(weatherModel.temperatureCurrentFeelsLike, response.main?.feelsLike);
      expect(weatherModel.temperatureMin, response.main?.tempMin);
      expect(weatherModel.temperatureMax, response.main?.tempMax);
    });

    test("Ensure that throws a Type Error when mandatory response field is null", () {
      // Arrange
      TranslateWeatherApi translateWeatherApi = TranslateWeatherApi();
      WeatherApiWeatherResponse response = WeatherApiMocks.weatherApiWeatherResponse(weatherMainValueNull: true);

      // Action and Assert
      expect(() => translateWeatherApi.toEntity(response), throwsA(isA<TypeError>()));
    });
  });
}
