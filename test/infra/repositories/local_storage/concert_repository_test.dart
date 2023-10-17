import 'package:flutter_test/flutter_test.dart';
import 'package:weather_forecast/domain/models/concert_model.dart';
import 'package:weather_forecast/infra/repositories/local_storage/concert_repository.dart';

void main() {
  group('Concert Repository Test', () {
    late ConcertRepository concertRepository;

    setUp(() {
      concertRepository = ConcertRepository();
    });

    test('Must return all concert data inside concert List', () async {
      // Action
      var result = await concertRepository.getAll();

      // Assert
      expect(result is List, true);
      expect(result is List<ConcertModel>, true);
      expect((result as List<ConcertModel>).isNotEmpty, true);
    });

    test('Must return the first concert data inside concert List', () async {
      // Action
      var result = await concertRepository.getFirst();

      // Assert
      expect(result, isNotNull);
      expect(result is ConcertModel, true);
      expect((result as ConcertModel).id, "1");
    });

    test('Must return null if there is no existent id data at where filter', () async {
      // Action
      var result = await concertRepository.get("222");

      // Assert
      expect(result, isNull);
    });

    test('Must return the desired/filtered data at where filter', () async {
      // Action
      var result = await concertRepository.get("3");

      // Assert
      expect(result, isNotNull);
      expect(result is ConcertModel, true);
      expect((result as ConcertModel).id, "3");
    });
  });
}
