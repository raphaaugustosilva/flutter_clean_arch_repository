import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_forecast/app/environment/environment.dart';
import 'package:weather_forecast/infra/http/http_provider_response.dart';
import 'package:weather_forecast/infra/weather_api/weather_api.dart';
import 'package:weather_forecast/infra/weather_api/i_weather_api.dart';
import 'package:weather_forecast/app/environment/base_config/i_env_base_config.dart';
import 'package:weather_forecast/infra/weather_api/http/weather_api_http_provider.dart';
import 'package:weather_forecast/infra/weather_api/http/i_weather_api_http_provider.dart';
import 'package:weather_forecast/infra/weather_api/models/weather_api_weather_response.dart';

import '../fixture_infra_reader_util.dart';

class WeatherApiHttpProviderMock extends Mock implements IWeatherApiHttpProvider {
  @override
  final IEnvBaseConfig environment;
  WeatherApiHttpProviderMock({required this.environment});

  @override
  Map<String, dynamic> queryParametersBase() => WeatherApiHttpProvider(environment: environment).queryParametersBase();

  @override
  Map<String, dynamic> queryParametersLatLong({required double lat, required double long}) => WeatherApiHttpProvider(environment: environment).queryParametersLatLong(lat: lat, long: long);
}

void main() {
  late IWeatherApiHttpProvider weatherApiHttpProviderMock;
  late IEnvBaseConfig envBaseConfig;
  late IWeatherApi weatherApi;

  setUp(() {
    envBaseConfig = Environment.instance.initConfig(environment: EEnvType.dev, apiUrl: "http://test.com", apiKey: "api_key_123_bla_bla_bla");
    GetIt.I.registerSingleton<IEnvBaseConfig>(envBaseConfig);
    weatherApiHttpProviderMock = WeatherApiHttpProviderMock(environment: envBaseConfig);
    weatherApi = WeatherApi(httpProvider: weatherApiHttpProviderMock);
  });

  group("Weater Api Tests", () {
    test("Ensure that Get Current Weather is returning the expected single result from a json content", () async {
      // Arrange
      String fileContent = fixtureInfra('get_current_weather.mock.json');

      when(() => weatherApiHttpProviderMock.get(
            url: '${envBaseConfig.baseUrlApi}/data/2.5/weather',
            queryParameters: any(named: "queryParameters"),
          )).thenAnswer(
        (_) async {
          return HttpProviderResponse(
            statusCode: 200,
            data: fileContent,
          );
        },
      );

      // Action
      WeatherApiWeatherResponse? result = await weatherApi.getCurrentWeather(lat: 1, long: -0.8);

      // Assert
      expect(result, isNotNull);
      expect(result!.dateTime, DateTime(2023, 10, 14, 21, 0, 0));
      expect(result.dateTimeTxt, "2023-10-15 09:00:00");

      expect(result.main, isNotNull);
      expect(result.main!.temp, 14);
      expect(result.main!.feelsLike, 18);
      expect(result.main!.tempMin, 8);
      expect(result.main!.tempMax, 22);

      expect(result.weather, isNotNull);
      expect(result.weather!.id, 1);
      expect(result.weather!.main, "Rain");
      expect(result.weather!.description, "It will rain all day long");
      expect(result.weather!.icon, "50n");
    });

    test("Ensure that Get Forecast Weather is returning the expected list results from a json content", () async {
      // Arrange
      String fileContent = fixtureInfra('get_forecast_weather.mock.json');

      when(() => weatherApiHttpProviderMock.get(
            url: '${envBaseConfig.baseUrlApi}/data/2.5/forecast',
            queryParameters: any(named: "queryParameters"),
          )).thenAnswer(
        (_) async {
          return HttpProviderResponse(
            statusCode: 200,
            data: fileContent,
          );
        },
      );

      // Action
      List<WeatherApiWeatherResponse>? result = await weatherApi.getForecastWeather(lat: 1, long: -0.8);

      // Assert
      expect(result, isNotNull);
      expect(result!.length, 5);
      expect(result[0].dateTime, DateTime(2023, 10, 15, 12, 0, 0));
      expect(result[0].dateTimeTxt, "2023-10-15 12:00:00");
      expect(result[0].main, isNotNull);
      expect(result[0].main!.temp, 14);
      expect(result[0].main!.feelsLike, 18);
      expect(result[0].main!.tempMin, 8);
      expect(result[0].main!.tempMax, 22);
      expect(result[0].weather, isNotNull);
      expect(result[0].weather!.id, 1);
      expect(result[0].weather!.main, "Rain");
      expect(result[0].weather!.description, "It will rain all day long");
      expect(result[0].weather!.icon, "50n");

      expect(result[1].dateTime, DateTime(2023, 10, 16, 12, 0, 0));
      expect(result[1].dateTimeTxt, "2023-10-16 12:00:00");
      expect(result[1].main, isNotNull);
      expect(result[1].main!.temp, 28);
      expect(result[1].main!.feelsLike, 28);
      expect(result[1].main!.tempMin, 20);
      expect(result[1].main!.tempMax, 30);
      expect(result[1].weather, isNotNull);
      expect(result[1].weather!.id, 2);
      expect(result[1].weather!.main, "Snow");
      expect(result[1].weather!.description, "It will snow all day long");
      expect(result[1].weather!.icon, "80n");

      expect(result[2].dateTime, DateTime(2023, 10, 17, 12, 0, 0));
      expect(result[2].dateTimeTxt, "2023-10-17 12:00:00");
      expect(result[2].main, isNotNull);
      expect(result[2].main!.temp, 10);
      expect(result[2].main!.feelsLike, 9);
      expect(result[2].main!.tempMin, 8);
      expect(result[2].main!.tempMax, 14);
      expect(result[2].weather, isNotNull);
      expect(result[2].weather!.id, 3);
      expect(result[2].weather!.main, "Snow");
      expect(result[2].weather!.description, "It will snow all day long");
      expect(result[2].weather!.icon, "80n");

      expect(result[3].dateTime, DateTime(2023, 10, 18, 12, 0, 0));
      expect(result[3].dateTimeTxt, "2023-10-18 12:00:00");
      expect(result[3].main, isNotNull);
      expect(result[3].main!.temp, 12);
      expect(result[3].main!.feelsLike, 10);
      expect(result[3].main!.tempMin, 8);
      expect(result[3].main!.tempMax, 14);
      expect(result[3].weather, isNotNull);
      expect(result[3].weather!.id, 4);
      expect(result[3].weather!.main, "Snow");
      expect(result[3].weather!.description, "It will snow all day long");
      expect(result[3].weather!.icon, "80n");

      expect(result[4].dateTime, DateTime(2023, 10, 19, 12, 0, 0));
      expect(result[4].dateTimeTxt, "2023-10-19 12:00:00");
      expect(result[4].main, isNotNull);
      expect(result[4].main!.temp, 4);
      expect(result[4].main!.feelsLike, 2);
      expect(result[4].main!.tempMin, 1);
      expect(result[4].main!.tempMax, 8);
      expect(result[4].weather, isNotNull);
      expect(result[4].weather!.id, 5);
      expect(result[4].weather!.main, "Snow");
      expect(result[4].weather!.description, "It will snow all day long");
      expect(result[4].weather!.icon, "80n");
    });

    tearDown(() => GetIt.I.reset());
  });
}
