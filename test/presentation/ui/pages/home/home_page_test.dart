import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../setup/general_widget_tests_setup.dart';
import 'package:weather_forecast/app/di/di_navigation.dart';
import 'package:weather_forecast/app/navigator/i_navigation.dart';
import 'package:weather_forecast/presentation/ui/pages/home/home_page.dart';
import 'package:weather_forecast/presentation/presenters/home/home_presenter.dart';
import 'package:weather_forecast/domain/services/usecases/concert/i_concert_get_all_use_case.dart';

import 'home_page_widget_keys.dart';

class ConcertGetAllUseCaseMock extends Mock implements IConcertGetAllUseCase {}

void main() {
  group("Home Page Tests", () {
    final GetIt getIt = GetIt.instance;
    late IConcertGetAllUseCase concertGetAllUseCaseMock;
    late HomePresenter homePresenter;

    setUp(() async {
      concertGetAllUseCaseMock = ConcertGetAllUseCaseMock();
      await DINavigation().configureInjection();
      await getIt.allReady();

      homePresenter = HomePresenter(navigation: getIt.get<INavigation>(), concertGetAllUseCase: concertGetAllUseCaseMock);
      getIt.registerFactory<HomePresenter>(() => homePresenter);
    });

    testWidgets('Ensure that Home Page shows the error widget if an error occurs', (WidgetTester tester) async {
      when(() => homePresenter.getAllConcerts()).thenThrow(Exception());

      await GeneralWidgetTestsSetup.initializeComponent(
        tester,
        const HomePage(),
      );

      Finder errorComponentElement = find.byKey(const Key(HomePageWidgetKeys.errorWidget));
      expect(errorComponentElement, findsOneWidget);
    });

    tearDown(() => GetIt.I.reset());
  });
}
