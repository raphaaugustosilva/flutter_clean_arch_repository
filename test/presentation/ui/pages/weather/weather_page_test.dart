import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'weather_page_widget_keys.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_forecast/domain/models/concert_model.dart';
import 'package:weather_forecast/presentation/ui/pages/weather/weather_page.dart';
import 'package:weather_forecast/presentation/presenters/weather/weather_presenter.dart';
import 'package:weather_forecast/domain/services/usecases/weather/i_weather_current_get_use_case.dart';
import 'package:weather_forecast/domain/services/usecases/weather/i_weather_forecast_get_use_case.dart';
import '../../setup/general_widget_tests_setup.dart';

class WeatherCurrentGetUseCaseMock extends Mock implements IWeatherCurrentGetUseCase {}

class WeatherForecastGetUseCaseMock extends Mock implements IWeatherForecastGetUseCase {}

void main() {
  group("Home Page Tests", () {
    final GetIt getIt = GetIt.instance;
    late IWeatherCurrentGetUseCase weatherCurrentGetUseCaseMock;
    late IWeatherForecastGetUseCase weatherForecastGetUseCaseMock;
    late WeatherPresenter weatherPresenter;
    late ConcertModel concertModelDataMock;

    setUp(() async {
      weatherCurrentGetUseCaseMock = WeatherCurrentGetUseCaseMock();
      weatherForecastGetUseCaseMock = WeatherForecastGetUseCaseMock();

      weatherPresenter = WeatherPresenter(weatherCurrentGetUseCase: weatherCurrentGetUseCaseMock, weatherForecastGetUseCase: weatherForecastGetUseCaseMock);
      concertModelDataMock = ConcertModel(id: "1", date: DateTime.now(), country: "BR", city: "Americana", coordinate: (lat: 1, long: 1));
      weatherPresenter.init(concertModelDataMock);
      getIt.registerFactory<WeatherPresenter>(() => weatherPresenter);
    });

    testWidgets('Ensure that Wheather Page shows the error widget if an error occurs', (WidgetTester tester) async {
      when(() => weatherPresenter.getWeatherDetails()).thenThrow(Exception());

      await GeneralWidgetTestsSetup.initializeComponent(
        tester,
        WeatherPage(
          arguments: WeatherPageArgs(concert: concertModelDataMock),
        ),
      );

      Finder errorComponentElement = find.byKey(const Key(WeatherPageWidgetKeys.errorWidget));
      expect(errorComponentElement, findsOneWidget);
    });

    tearDown(() => GetIt.I.reset());
  });
}
