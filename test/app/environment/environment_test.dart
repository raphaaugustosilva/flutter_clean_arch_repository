import 'package:flutter_test/flutter_test.dart';
import 'package:weather_forecast/app/environment/environment.dart';
import 'package:weather_forecast/app/environment/base_config/i_env_base_config.dart';

void main() {
  group('Environment tests', () {
    test('If an invalid environment is provided, then the default environment must be DEV', () async {
      // Arrange
      String invalidEnv = "ENV_BLA_BLA_BLA";

      // Action
      EEnvType result = invalidEnv.getEnvType();

      // Assert
      expect(result, EEnvType.dev);
    });

    test('If valid environment is provided, then the result must be this environment', () async {
      // Arrange
      String devEnvironment = "DEV";
      String prodEnvironment = "PROD";

      // Action
      EEnvType devEnvEnum = devEnvironment.getEnvType();
      EEnvType prodEnvEnum = prodEnvironment.getEnvType();

      // Assert
      expect(devEnvEnum, EEnvType.dev);
      expect(prodEnvEnum, EEnvType.prod);
    });

    test('Sets correctly the api configuration inside environment', () async {
      // Arrange
      Environment.instance.initConfig(environment: EEnvType.dev, apiUrl: "http://test.com", apiKey: "api_key_123_bla_bla_bla");

      // Assert
      expect(Environment.instance.config.baseUrlApi, "http://test.com");
      expect(Environment.instance.config.apiKey, "api_key_123_bla_bla_bla");
    });
  });
}
