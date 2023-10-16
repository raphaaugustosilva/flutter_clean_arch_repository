import 'package:flutter_test/flutter_test.dart';
import 'package:weather_forecast/app/environment/base_config/i_env_base_config.dart';
import 'package:weather_forecast/app/environment/environment.dart';
import 'package:weather_forecast/infra/weather_api/http/weather_api_http_provider.dart';

void main() {
  group('Weather API Http Provider Test', () {
    late WeatherApiHttpProvider weatherApiHttpProvider;

    setUp(() {
      Environment.instance.initConfig(environment: EEnvType.dev, apiUrl: "http://test.com", apiKey: "api_key_123_bla_bla_bla");
      weatherApiHttpProvider = WeatherApiHttpProvider(environment: Environment.instance.config);
    });

    test('Must return queryParametersBase with correct and expected data', () async {
      // Action
      Map<String, dynamic> queryParametersResult = weatherApiHttpProvider.queryParametersBase();

      // Assert
      expect(queryParametersResult, isNotNull);
      expect(queryParametersResult.containsKey("appid"), true);
      expect(queryParametersResult["appid"], "api_key_123_bla_bla_bla");
      expect(queryParametersResult.containsKey("units"), true);
      expect(queryParametersResult["units"], "imperial");
    });

    test('Must return queryParametersLatLong with correct and expected data', () async {
      // Arrange
      double latMock = 1.2;
      double longMock = -0.82;

      // Action
      Map<String, dynamic> queryParametersLatLongResult = weatherApiHttpProvider.queryParametersLatLong(lat: latMock, long: longMock);

      // Assert
      expect(queryParametersLatLongResult, isNotNull);
      expect(queryParametersLatLongResult.containsKey("lat"), true);
      expect(queryParametersLatLongResult["lat"], latMock);
      expect(queryParametersLatLongResult.containsKey("lon"), true);
      expect(queryParametersLatLongResult["lon"], longMock);
    });
  });
}
