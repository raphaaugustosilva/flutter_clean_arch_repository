import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_forecast/app/di/di_navigation.dart';
import 'package:weather_forecast/app/navigator/i_navigation.dart';
import 'package:weather_forecast/domain/models/concert_model.dart';
import 'package:weather_forecast/presentation/presenters/home/home_presenter.dart';
import 'package:weather_forecast/domain/infra/repositories/i_concert_repository.dart';
import 'package:weather_forecast/infra/repositories/local_storage/concert_repository.dart';
import 'package:weather_forecast/domain/services/usecases/concert/i_concert_get_all_use_case.dart';

class ConcertGetAllUseCaseMock extends Mock implements IConcertGetAllUseCase {
  final IConcertRepository concertRepository;
  ConcertGetAllUseCaseMock({required this.concertRepository});
}

void main() {
  late IConcertGetAllUseCase concertGetAllUseCaseMock;
  late HomePresenter homePresenter;
  late List<ConcertModel> concertModelListDataMock;

  setUp(() async {
    GetIt getIt = GetIt.instance;
    concertGetAllUseCaseMock = ConcertGetAllUseCaseMock(concertRepository: ConcertRepository());
    await DINavigation().configureInjection();
    await getIt.allReady();
    INavigation navigation = getIt.get<INavigation>();
    homePresenter = HomePresenter(navigation: navigation, concertGetAllUseCase: concertGetAllUseCaseMock);

    concertModelListDataMock = [
      ConcertModel(id: "1", date: DateTime.now(), country: "BR", city: "Americana", coordinate: (lat: 1, long: -0.2)),
      ConcertModel(id: "2", date: DateTime.now(), country: "BR", city: "São Paulo", coordinate: (lat: -1.2, long: -0.8)),
      ConcertModel(id: "3", date: DateTime.now(), country: "US", city: "Miami", coordinate: (lat: 1.8, long: 0.6)),
    ];
  });

  group("Home Presenter Tests", () {
    test("Must fill the internal presenter concert list after geeting data from use case", () async {
      // Arrange
      when(() => concertGetAllUseCaseMock.execute()).thenAnswer((_) async => concertModelListDataMock);

      // Action
      await homePresenter.getAllConcerts();

      // Assert
      expect(homePresenter.concertList, isNotNull);
      expect(homePresenter.concertList.length, 3);
      expect(homePresenter.concertList[0].id, "1");
      expect(homePresenter.concertList[1].id, "2");
      expect(homePresenter.concertList[2].id, "3");
    });

    test("Must fill the internal presenter concert list with EMPTY after geeting no existing data from use case", () async {
      // Arrange
      when(() => concertGetAllUseCaseMock.execute()).thenAnswer((_) async => null);

      // Action
      await homePresenter.getAllConcerts();

      // Assert
      expect(homePresenter.concertList, isNotNull);
      expect(homePresenter.concertList, isEmpty);
    });

    test("Must fill the internal presenter concert list with EMPTY after throwing an error", () async {
      // Arrange
      when(() => concertGetAllUseCaseMock.execute()).thenThrow(Exception());

      // Action
      await homePresenter.getAllConcerts();

      // Assert
      expect(homePresenter.concertList, isNotNull);
      expect(homePresenter.concertList, isEmpty);
      expect(homePresenter.hasError, true);
    });

    test("Must filter concert by name correctly", () async {
      // Arrange
      when(() => concertGetAllUseCaseMock.execute()).thenAnswer((_) async => concertModelListDataMock);

      // Action
      await homePresenter.getAllConcerts();
      homePresenter.searchConcert("ão Paulo");

      // Assert
      expect(homePresenter.concertList, isNotNull);
      expect(homePresenter.concertList.length, 1);
      expect(homePresenter.concertList[0].id, "2");
    });

    test("Must return all concerts after cleaning a previosly filtered result", () async {
      // Arrange
      when(() => concertGetAllUseCaseMock.execute()).thenAnswer((_) async => concertModelListDataMock);

      // Action
      await homePresenter.getAllConcerts();
      homePresenter.searchConcert("ão Paulo");

      // Assert
      expect(homePresenter.concertList, isNotNull);
      expect(homePresenter.concertList.length, 1);
      expect(homePresenter.concertList[0].id, "2");

      // Action
      homePresenter.cleanSearch();

      // Assert
      expect(homePresenter.concertList, isNotNull);
      expect(homePresenter.concertList.length, 3);
    });

    tearDown(() => GetIt.I.reset());
  });
}
