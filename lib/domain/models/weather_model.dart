import 'package:equatable/equatable.dart';
import 'package:weather_forecast/domain/i_entity_model.dart';

class WeatherModel extends Equatable implements IEntityModel {
  final String summary;
  final String? description;
  final String? icon;
  final double temperatureCurrent;
  final double temperatureCurrentFeelsLike;
  final double temperatureMin;
  final double temperatureMax;

  const WeatherModel({
    required this.summary,
    required this.description,
    required this.icon,
    required this.temperatureCurrent,
    required this.temperatureCurrentFeelsLike,
    required this.temperatureMin,
    required this.temperatureMax,
  });

  @override
  List<Object?> get props => [
        summary,
        description,
        icon,
        temperatureCurrent,
        temperatureCurrentFeelsLike,
        temperatureMin,
        temperatureMax,
      ];
}
