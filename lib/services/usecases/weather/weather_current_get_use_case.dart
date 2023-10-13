import 'package:weather_forecast/domain/models/weather_model.dart';
import 'package:weather_forecast/infra/weather_api/i_weather_api.dart';
import 'package:weather_forecast/infra/infra_generic/infra_base_extension.dart';
import 'package:weather_forecast/infra/weather_api/translates/translate_weather_api.dart';
import 'package:weather_forecast/domain/services/usecases/weather/i_weather_current_get_use_case.dart';

class WeatherCurrentGetUseCase implements IWeatherCurrentGetUseCase {
  final IWeatherApi weatherApi;

  const WeatherCurrentGetUseCase({required this.weatherApi});
  @override
  Future<WeatherModel?> execute({required double lat, required double long}) async {
    var response = await weatherApi.getCurrentWeather(lat: lat, long: long);
    WeatherModel? weather = response?.toEntity(TranslateWeatherApi()) as WeatherModel;
    return weather;
  }
}
