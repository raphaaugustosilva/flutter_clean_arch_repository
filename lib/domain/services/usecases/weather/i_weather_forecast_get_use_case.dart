import 'package:weather_forecast/domain/models/weather_model.dart';

abstract interface class IWeatherForecastGetUseCase {
  Future<List<WeatherModel>?> execute({required double lat, required double long});
}
