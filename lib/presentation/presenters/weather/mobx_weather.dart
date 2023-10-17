import 'package:mobx/mobx.dart';
import 'package:weather_forecast/domain/models/weather_model.dart';
import 'package:weather_forecast/presentation/presenters/mobx_base_store.dart';

part 'mobx_weather.g.dart';

class MobxWeather = MobxWeatherBase with _$MobxWeather;

abstract class MobxWeatherBase extends MobxBaseStore with Store {
  @observable
  WeatherModel? weatherCurrent;

  @action
  setWeatherCurrent(WeatherModel? value) => weatherCurrent = value;

  @observable
  ObservableList<WeatherModel> weatherForecastList = ObservableList<WeatherModel>();

  @action
  setWeatherForecastList(List<WeatherModel>? list) {
    weatherForecastList.clear();
    if (list != null) weatherForecastList.addAll(list);
  }
}
