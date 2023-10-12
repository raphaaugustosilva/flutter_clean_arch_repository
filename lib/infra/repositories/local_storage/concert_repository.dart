import 'package:weather_forecast/domain/models/concert_model.dart';
import 'package:weather_forecast/app/utils/extensions/iterable_extension.dart';
import 'package:weather_forecast/domain/infra/repositories/i_concert_repository.dart';

class ConcertRepository implements IConcertRepository {
  final List<ConcertModel> _fixedConcertModelList = [
    ConcertModel(id: "1", date: DateTime(2023, 10, 20), country: "UK", city: "Silverstone", coordinate: (lat: 52.0877287, long: -1.0241177)),
    ConcertModel(id: "2", date: DateTime(2023, 10, 21), country: "Brazil", city: "São Paulo", coordinate: (lat: -23.5506507, long: -46.6333824)),
    ConcertModel(id: "3", date: DateTime(2023, 10, 27), country: "Australia", city: "Melbourne", coordinate: (lat: -37.8142176, long: 144.9631608)),
    ConcertModel(id: "4", date: DateTime(2023, 10, 28), country: "Monaco", city: "Monte Carlo", coordinate: (lat: 43.7402961, long: 7.426559)),
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
