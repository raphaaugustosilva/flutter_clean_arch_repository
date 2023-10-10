import 'package:flutter/material.dart';
import 'package:weather_forecast/app/environment/base_config/i_env_base_config.dart';

class EnvBaseConfig implements IEnvBaseConfig {
  late String _baseUrlApi;
  late String _apiClientId;
  late EEnvType _type;
  late String _label;
  late Color _color;

  EnvBaseConfig.dev(String urlApi) {
    _type = EEnvType.dev;
    _baseUrlApi = urlApi;
    _label = "DEV";
    _color = Colors.red;
  }

  EnvBaseConfig.prod(String urlApi) {
    _type = EEnvType.prod;
    _baseUrlApi = urlApi;
    _label = "PROD";
    _color = Colors.blue;
  }

  @override
  String get baseUrlApi => _baseUrlApi;

  @override
  String get apiClientId => _apiClientId;

  @override
  EEnvType get type => _type;

  @override
  String get label => _label;

  @override
  Color get color => _color;

  @override
  void setApiClientId(String value) {
    _apiClientId = value;
  }
}
