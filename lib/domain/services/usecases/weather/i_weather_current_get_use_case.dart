import 'package:weather_forecast/domain/models/weather_model.dart';

abstract interface class IWeatherCurrentGetUseCase {
  Future<WeatherModel?> execute({required double lat, required double long});
}
