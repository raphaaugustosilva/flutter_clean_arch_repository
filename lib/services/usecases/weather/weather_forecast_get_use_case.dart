import 'package:weather_forecast/domain/models/weather_model.dart';
import 'package:weather_forecast/infra/weather_api/i_weather_api.dart';
import 'package:weather_forecast/app/utils/extensions/iterable_extension.dart';
import 'package:weather_forecast/infra/infra_generic/infra_base_extension.dart';
import 'package:weather_forecast/infra/weather_api/translates/translate_weather_api.dart';
import 'package:weather_forecast/domain/services/usecases/weather/i_weather_forecast_get_use_case.dart';

class WeatherForecastGetUseCase implements IWeatherForecastGetUseCase {
  final IWeatherApi weatherApi;

  const WeatherForecastGetUseCase({required this.weatherApi});

  @override
  Future<List<WeatherModel>?> execute({required double lat, required double long}) async {
    var response = await weatherApi.getForecastWeather(lat: lat, long: long);
    List<WeatherModel>? weatherCompleteList = response?.toEntityList(TranslateWeatherApi()) as List<WeatherModel>?;

    List<WeatherModel>? result = [];

    //Gets only one weather for each 12:00 hour of each day
    var weathersByDay = weatherCompleteList?.groupBy((weather) => weather.dateTime.day);
    weathersByDay?.entries.forEach((item) {
      //Gets the min and max temperature for each day
      double minTemperature = item.value.reduce((a, b) => a.temperatureMin < b.temperatureMin ? a : b).temperatureMin;
      double maxTemperature = item.value.reduce((a, b) => a.temperatureMax > b.temperatureMax ? a : b).temperatureMax;

      WeatherModel? middayWeather = item.value.firstWhereOrNull((e) => e.dateTime.hour == 12);
      if (middayWeather != null) {
        result.add(
          WeatherModel(
            dateTime: middayWeather.dateTime,
            summary: middayWeather.summary,
            description: middayWeather.description,
            icon: middayWeather.icon,
            temperatureCurrent: middayWeather.temperatureCurrent,
            temperatureCurrentFeelsLike: middayWeather.temperatureCurrentFeelsLike,
            temperatureMin: minTemperature,
            temperatureMax: maxTemperature,
          ),
        );
      }
    });

    return result;
  }
}
