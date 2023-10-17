import 'package:flutter/material.dart';
import 'package:weather_forecast/app/environment/base_config/i_env_base_config.dart';

class EnvBaseConfig implements IEnvBaseConfig {
  late String _baseUrlApi;
  late String _apiKey;
  late EEnvType _type;
  late String _label;
  late Color _color;

  EnvBaseConfig.dev() {
    _type = EEnvType.dev;
    _label = "DEV";
    _color = Colors.red;
  }

  EnvBaseConfig.prod() {
    _type = EEnvType.prod;
    _label = "PROD";
    _color = Colors.blue;
  }

  @override
  String get baseUrlApi => _baseUrlApi;

  @override
  String get apiKey => _apiKey;

  @override
  EEnvType get type => _type;

  @override
  String get label => _label;

  @override
  Color get color => _color;

  @override
  void setApiConfig({required String apiUrl, required String apiKey}) {
    _baseUrlApi = apiUrl;
    _apiKey = apiKey;
  }
}
