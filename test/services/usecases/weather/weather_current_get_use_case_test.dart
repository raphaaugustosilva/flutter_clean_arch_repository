import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_forecast/domain/models/weather_model.dart';
import 'package:weather_forecast/infra/weather_api/i_weather_api.dart';
import 'package:weather_forecast/infra/weather_api/models/weather_api_weather_response.dart';
import 'package:weather_forecast/services/usecases/weather/weather_current_get_use_case.dart';
import 'package:weather_forecast/domain/services/usecases/weather/i_weather_current_get_use_case.dart';

import '../../../infra/weather_api/mocks/weather_api_mocks.dart';

class WeatherApiMock extends Mock implements IWeatherApi {}

void main() {
  late IWeatherApi weatherApiMock;
  late IWeatherCurrentGetUseCase weatherCurrentGetUseCase;

  setUp(() {
    weatherApiMock = WeatherApiMock();
    weatherCurrentGetUseCase = WeatherCurrentGetUseCase(weatherApi: weatherApiMock);
  });

  group("Weather Current Use Case Tests", () {
    test("Should return a valid WeatherModel when everyting is fine", () async {
      WeatherApiWeatherResponse responseMocked = WeatherApiMocks.weatherApiWeatherResponse();

      // Arrange
      when(() => weatherApiMock.getCurrentWeather(
            lat: any(named: "lat"),
            long: any(named: "long"),
          )).thenAnswer(
        (_) async => responseMocked,
      );

      // Action
      WeatherModel? result = await weatherCurrentGetUseCase.execute(lat: 1, long: 1);

      // Assert
      expect(result, isNotNull);
      expect(result, isNotNull);
      expect(result!.dateTime, DateTime(2023, 10, 14, 21, 0, 0));

      expect(result.summary, responseMocked.weather?.main);
      expect(result.description, responseMocked.weather?.description);
      expect(result.icon, responseMocked.weather?.icon);
      expect(result.temperatureCurrent, responseMocked.main?.temp);
      expect(result.temperatureCurrentFeelsLike, responseMocked.main?.feelsLike);
      expect(result.temperatureMin, responseMocked.main?.tempMin);
      expect(result.temperatureMax, responseMocked.main?.tempMax);
    });

    test("Should return null if there is no data at API", () async {
      // Arrange
      when(() => weatherApiMock.getCurrentWeather(
            lat: any(named: "lat"),
            long: any(named: "long"),
          )).thenAnswer(
        (_) async => null,
      );

      // Action
      WeatherModel? result = await weatherCurrentGetUseCase.execute(lat: 1, long: 1);

      // Assert
      expect(result, isNull);
    });
  });
}
