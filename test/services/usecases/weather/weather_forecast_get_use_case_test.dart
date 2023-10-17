import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_forecast/domain/models/weather_model.dart';
import 'package:weather_forecast/infra/weather_api/i_weather_api.dart';
import 'package:weather_forecast/infra/weather_api/models/weather_api_weather_response.dart';
import 'package:weather_forecast/services/usecases/weather/weather_forecast_get_use_case.dart';
import 'package:weather_forecast/domain/services/usecases/weather/i_weather_forecast_get_use_case.dart';

import '../../../infra/weather_api/mocks/weather_api_mocks.dart';

class WeatherApiMock extends Mock implements IWeatherApi {}

void main() {
  late IWeatherApi weatherApiMock;
  late IWeatherForecastGetUseCase weatherForecastGetUseCase;

  setUp(() {
    weatherApiMock = WeatherApiMock();
    weatherForecastGetUseCase = WeatherForecastGetUseCase(weatherApi: weatherApiMock);
  });

  group("Weather Forcast Use Case Tests", () {
    test("Should return a valid WeatherModel when everyting is fine", () async {
      List<WeatherApiWeatherResponse> responseListMocked = WeatherApiMocks.weatherApiWeatherListResponse();

      // Arrange
      when(() => weatherApiMock.getForecastWeather(
            lat: any(named: "lat"),
            long: any(named: "long"),
          )).thenAnswer(
        (_) async => responseListMocked,
      );

      // Action
      List<WeatherModel>? result = await weatherForecastGetUseCase.execute(lat: 1, long: 1);

      // Assert
      expect(result, isNotNull);
    });

    test("Should return a valid WeatherModel grouped by date when everyting is fine", () async {
      List<WeatherApiWeatherResponse> responseListMocked = WeatherApiMocks.weatherApiWeatherListResponse();

      // Arrange
      when(() => weatherApiMock.getForecastWeather(
            lat: any(named: "lat"),
            long: any(named: "long"),
          )).thenAnswer(
        (_) async => responseListMocked,
      );

      // Action
      List<WeatherModel>? result = await weatherForecastGetUseCase.execute(lat: 1, long: 1);

      // Assert
      expect(result, isNotNull);
      expect(responseListMocked.length, 3);
      expect(result?.length, 2);

      expect(result![0].dateTime, DateTime(2023, 10, 16, 12, 0, 0));
      expect(result[0].summary, "Fine");
      expect(result[0].description, "It will be fine all day long");
      expect(result[0].icon, "50n");
      expect(result[0].temperatureCurrent, 14);
      expect(result[0].temperatureCurrentFeelsLike, 18);
      expect(result[0].temperatureMin, 8);
      expect(result[0].temperatureMax, 22);

      expect(result[1].dateTime, DateTime(2023, 10, 18, 12, 0, 0));
      expect(result[1].summary, "Snow");
      expect(result[1].description, "It will snow all day long");
      expect(result[1].icon, "50n");
      expect(result[1].temperatureCurrent, 10);
      expect(result[1].temperatureCurrentFeelsLike, 8);
      expect(result[1].temperatureMin, 8);
      expect(result[1].temperatureMax, 20);
    });
  });
}
