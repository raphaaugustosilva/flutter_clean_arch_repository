import 'package:weather_forecast/domain/models/concert_model.dart';
import 'package:weather_forecast/app/utils/extensions/iterable_extension.dart';
import 'package:weather_forecast/domain/infra/repositories/i_concert_repository.dart';

class ConcertRepository implements IConcertRepository {
  final List<ConcertModel> _fixedConcertModelList = [
    ConcertModel(id: "1", date: DateTime(2023, 10, 20), country: "UK", city: "Silverstone"),
    ConcertModel(id: "2", date: DateTime(2023, 10, 21), country: "Brazil", city: "São Paulo"),
    ConcertModel(id: "3", date: DateTime(2023, 10, 27), country: "Australia", city: "Melbourne"),
    ConcertModel(id: "4", date: DateTime(2023, 10, 28), country: "Monaco", city: "Monte Carlo"),
  ];

  @override
  String get repositoryName => "concert";

  @override
  Future<ConcertModel?> get(String id) async {
    return _fixedConcertModelList.firstWhereOrNull((e) => e.id == id);
  }

  @override
  Future<List<ConcertModel>?> getAll() async {
    return _fixedConcertModelList;
  }

  @override
  Future<ConcertModel?> getFirst() async {
    return _fixedConcertModelList.firstOrNull;
  }
}
