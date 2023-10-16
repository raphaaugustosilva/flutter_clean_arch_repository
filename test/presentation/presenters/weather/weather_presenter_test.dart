import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_forecast/domain/models/concert_model.dart';
import 'package:weather_forecast/domain/models/weather_model.dart';
import 'package:weather_forecast/presentation/presenters/weather/weather_presenter.dart';
import 'package:weather_forecast/domain/services/usecases/weather/i_weather_current_get_use_case.dart';
import 'package:weather_forecast/domain/services/usecases/weather/i_weather_forecast_get_use_case.dart';

class WeatherCurrentGetUseCaseMock extends Mock implements IWeatherCurrentGetUseCase {}

class WeatherForecastGetUseCaseMock extends Mock implements IWeatherForecastGetUseCase {}

void main() {
  late IWeatherCurrentGetUseCase weatherCurrentGetUseCaseMock;
  late IWeatherForecastGetUseCase weatherForecastGetUseCaseMock;
  late WeatherPresenter weatherPresenter;

  setUp(() {
    weatherCurrentGetUseCaseMock = WeatherCurrentGetUseCaseMock();
    weatherForecastGetUseCaseMock = WeatherForecastGetUseCaseMock();
    weatherPresenter = WeatherPresenter(weatherCurrentGetUseCase: weatherCurrentGetUseCaseMock, weatherForecastGetUseCase: weatherForecastGetUseCaseMock);
    weatherPresenter.init(ConcertModel(id: "1", date: DateTime.now(), country: "BR", city: "Americana", coordinate: (lat: 1, long: 1)));
  });

  group("Home Presenter Tests", () {
    test("Must fill the current weather data after geeting data from use case", () async {
      // Arrange
      when(() => weatherCurrentGetUseCaseMock.execute(lat: any(named: "lat"), long: any(named: "long"))).thenAnswer(
        (_) async => WeatherModel(
          dateTime: DateTime.now(),
          summary: "Summary 01",
          description: "Description",
          icon: "icon.png",
          temperatureCurrent: 18,
          temperatureCurrentFeelsLike: 20,
          temperatureMin: 10,
          temperatureMax: 28,
        ),
      );

      // Action
      await weatherPresenter.getWeatherDetails();

      // Assert
      expect(weatherPresenter.weatherCurrent, isNotNull);
      expect(weatherPresenter.weatherCurrent!.summary, "Summary 01");
    });

    test("Must fill the current weather forecast data after geeting data from use case", () async {
      // Arrange
      when(() => weatherCurrentGetUseCaseMock.execute(lat: any(named: "lat"), long: any(named: "long"))).thenAnswer(
        (_) async => WeatherModel(
          dateTime: DateTime.now(),
          summary: "Summary 01",
          description: "Description",
          icon: "icon.png",
          temperatureCurrent: 18,
          temperatureCurrentFeelsLike: 20,
          temperatureMin: 10,
          temperatureMax: 28,
        ),
      );

      when(() => weatherForecastGetUseCaseMock.execute(lat: any(named: "lat"), long: any(named: "long"))).thenAnswer((_) async => [
            WeatherModel(
              dateTime: DateTime.now(),
              summary: "Summary 01",
              description: "Description 01",
              icon: "icon_01.png",
              temperatureCurrent: 18,
              temperatureCurrentFeelsLike: 20,
              temperatureMin: 10,
              temperatureMax: 28,
            ),
            WeatherModel(
              dateTime: DateTime.now(),
              summary: "Summary 02",
              description: "Description 02",
              icon: "icon_02.png",
              temperatureCurrent: 2,
              temperatureCurrentFeelsLike: 20,
              temperatureMin: 1,
              temperatureMax: 28,
            ),
          ]);

      // Action
      await weatherPresenter.getWeatherDetails();

      // Assert
      expect(weatherPresenter.weatherForecastList, isNotNull);
      expect(weatherPresenter.weatherForecastList.length, 2);
      expect(weatherPresenter.weatherForecastList[0].summary, "Summary 01");
      expect(weatherPresenter.weatherForecastList[1].summary, "Summary 02");
    });

    test("Must fill the internal presenter weather current and forecast list with EMPTY after throwing an error", () async {
      // Arrange
      when(() => weatherCurrentGetUseCaseMock.execute(lat: any(named: "lat"), long: any(named: "long"))).thenThrow(Exception());

      // Action
      await weatherPresenter.getWeatherDetails();

      // Assert
      expect(weatherPresenter.weatherCurrent, isNull);
      expect(weatherPresenter.weatherForecastList, isEmpty);
      expect(weatherPresenter.hasError, true);
    });
  });
}
