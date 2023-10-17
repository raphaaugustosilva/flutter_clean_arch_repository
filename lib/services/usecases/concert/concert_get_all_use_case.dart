import 'package:weather_forecast/domain/models/concert_model.dart';
import 'package:weather_forecast/domain/infra/repositories/i_concert_repository.dart';
import 'package:weather_forecast/domain/services/usecases/concert/i_concert_get_all_use_case.dart';

class ConcertGetAllUseCase implements IConcertGetAllUseCase {
  final IConcertRepository concertRepository;
  const ConcertGetAllUseCase({required this.concertRepository});

  @override
  Future<List<ConcertModel>?> execute() async {
    return await concertRepository.getAll();
  }
}
