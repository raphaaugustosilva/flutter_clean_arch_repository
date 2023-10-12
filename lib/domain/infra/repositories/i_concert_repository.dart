import 'package:weather_forecast/domain/models/concert_model.dart';
import 'package:weather_forecast/domain/infra/repositories/i_repository.dart';

abstract interface class IConcertRepository extends IRepository<ConcertModel> {
  IConcertRepository({required super.repositoryName});
}
