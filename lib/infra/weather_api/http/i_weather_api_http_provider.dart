import 'package:weather_forecast/domain/infra/http/i_http_provider.dart';
import 'package:weather_forecast/app/environment/base_config/i_env_base_config.dart';

abstract interface class IWeatherApiHttpProvider extends IHttpProvider {
  final IEnvBaseConfig environment;
  IWeatherApiHttpProvider({required this.environment});
  Map<String, dynamic> queryParametersBase();
  Map<String, dynamic> queryParametersLatLong({required double lat, required double long});
}
