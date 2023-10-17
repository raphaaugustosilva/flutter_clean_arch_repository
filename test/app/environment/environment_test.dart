import 'package:flutter/material.dart';
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
      Environment.instance.initConfig(environment: EEnvType.dev, apiUrl: "http://dev.test.com", apiKey: "api_key_123_bla_bla_bla_dev");

      // Assert
      expect(Environment.instance.config.baseUrlApi, "http://dev.test.com");
      expect(Environment.instance.config.apiKey, "api_key_123_bla_bla_bla_dev");
      expect(Environment.instance.config.type, EEnvType.dev);
      expect(Environment.instance.config.label, "DEV");
      expect(Environment.instance.config.color, Colors.red);
    });

    test('Sets correctly the api configuration for prod inside environment', () async {
      // Arrange
      Environment.instance.initConfig(environment: EEnvType.prod, apiUrl: "http://prod.test.com", apiKey: "api_key_123_bla_bla_bla_prod");

      // Assert
      expect(Environment.instance.config.baseUrlApi, "http://prod.test.com");
      expect(Environment.instance.config.apiKey, "api_key_123_bla_bla_bla_prod");
      expect(Environment.instance.config.type, EEnvType.prod);
      expect(Environment.instance.config.label, "PROD");
      expect(Environment.instance.config.color, Colors.blue);
    });
  });
}
