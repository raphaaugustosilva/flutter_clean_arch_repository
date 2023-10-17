import 'package:weather_forecast/domain/models/concert_model.dart';
import 'package:weather_forecast/presentation/presenters/weather/mobx_weather.dart';
import 'package:weather_forecast/domain/services/usecases/weather/i_weather_current_get_use_case.dart';
import 'package:weather_forecast/domain/services/usecases/weather/i_weather_forecast_get_use_case.dart';

class WeatherPresenter extends MobxWeather {
  final IWeatherCurrentGetUseCase weatherCurrentGetUseCase;
  final IWeatherForecastGetUseCase weatherForecastGetUseCase;
  WeatherPresenter({required this.weatherCurrentGetUseCase, required this.weatherForecastGetUseCase});

  late ConcertModel _concert;
  void init(ConcertModel concert) {
    _concert = concert;
  }

  Future<void> getWeatherDetails() async {
    try {
      setIsLoading(true);
      setHasError(false);
      setWeatherCurrent(await weatherCurrentGetUseCase.execute(lat: _concert.coordinate.lat, long: _concert.coordinate.long));
      setWeatherForecastList(await weatherForecastGetUseCase.execute(lat: _concert.coordinate.lat, long: _concert.coordinate.long));
    } catch (_) {
      setHasError(true);
    } finally {
      setIsLoading(false);
    }
  }
}
