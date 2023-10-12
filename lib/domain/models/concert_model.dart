import 'package:equatable/equatable.dart';
import 'package:weather_forecast/domain/i_entity_model.dart';

class ConcertModel extends Equatable implements IEntityModel {
  final String id;
  final DateTime date;
  final String country;
  final String city;

  const ConcertModel({
    required this.id,
    required this.date,
    required this.country,
    required this.city,
  });

  @override
  List<Object?> get props => [id, date, country, city];
}
