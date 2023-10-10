import 'package:weather_forecast/domain/models/concert_model.dart';
import 'package:weather_forecast/domain/services/usecases/concert/i_concert_get_all_use_case.dart';

class ConcertGetAllUseCase implements IConcertGetAllUseCase {
  @override
  Future<List<ConcertModel>?> execute() async {
    await Future.delayed(const Duration(seconds: 2)); //TODO: remover

    //TODO: rever
    return [
      ConcertModel(date: DateTime(2023, 10, 20), country: "UK", city: "Silverstone"),
      ConcertModel(date: DateTime(2023, 10, 21), country: "Brazil", city: "São Paulo"),
      ConcertModel(date: DateTime(2023, 10, 27), country: "Australia", city: "Melbourne"),
      ConcertModel(date: DateTime(2023, 10, 28), country: "Monaco", city: "Monte Carlo"),
    ];
  }
}
