import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_forecast/domain/models/concert_model.dart';
import 'package:weather_forecast/domain/infra/repositories/i_concert_repository.dart';
import 'package:weather_forecast/services/usecases/concert/concert_get_all_use_case.dart';
import 'package:weather_forecast/domain/services/usecases/concert/i_concert_get_all_use_case.dart';

class ConcertRepositoryMock extends Mock implements IConcertRepository {}

void main() {
  late IConcertRepository concertRepositoryMock;
  late IConcertGetAllUseCase concertGetAllUseCase;

  setUp(() {
    concertRepositoryMock = ConcertRepositoryMock();
    concertGetAllUseCase = ConcertGetAllUseCase(concertRepository: concertRepositoryMock);
  });

  group("Concert Use Case Tests", () {
    test("Must return a list of ConcertModel when there are data at repository", () async {
      // Arrange
      when(() => concertRepositoryMock.getAll()).thenAnswer(
        (_) async {
          return [
            ConcertModel(id: "1", date: DateTime.now(), country: "BR", city: "Americana", coordinate: (lat: 1, long: -0.2)),
            ConcertModel(id: "2", date: DateTime.now(), country: "BR", city: "São Paulo", coordinate: (lat: -1.2, long: -0.8)),
            ConcertModel(id: "3", date: DateTime.now(), country: "US", city: "Miami", coordinate: (lat: 1.8, long: 0.6)),
          ];
        },
      );

      // Action
      List<ConcertModel>? result = await concertGetAllUseCase.execute();

      // Assert
      expect(result, isNotNull);
      expect(result!.length, 3);
    });

    test("Must return null when there are no data at repository", () async {
      // Arrange
      when(() => concertRepositoryMock.getAll()).thenAnswer(
        (_) async {
          return null;
        },
      );

      // Action
      List<ConcertModel>? result = await concertGetAllUseCase.execute();

      // Assert
      expect(result, isNull);
    });
  });
}
