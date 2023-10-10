import 'package:weather_forecast/domain/models/concert_model.dart';

abstract interface class IConcertGetAllUseCase {
  Future<List<ConcertModel>?> execute();
}
