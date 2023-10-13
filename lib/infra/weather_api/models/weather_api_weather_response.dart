// ignore_for_file: library_private_types_in_public_api

import 'package:equatable/equatable.dart';
import 'package:weather_forecast/infra/infra_generic/i_infra_response.dart';

class WeatherApiWeatherResponse extends Equatable implements IInfraResponse {
  final _WeatherWeatherResponse? weather;
  final _WeatherMainResponse? main;
  final String? dtTxt;
  const WeatherApiWeatherResponse({
    required this.weather,
    required this.main,
    required this.dtTxt,
  });

  factory WeatherApiWeatherResponse.fromJson(Map<String, dynamic> json) {
    return WeatherApiWeatherResponse(
      weather: (json['weather'] == null || (json['weather'] is List && (json['weather'] as List).isEmpty)) ? null : _WeatherWeatherResponse.fromJson(json['weather'][0]),
      main: json['main'] == null ? null : _WeatherMainResponse.fromJson(json['main']),
      dtTxt: json['dt_txt'],
    );
  }

  @override
  List<Object?> get props => [weather, main, dtTxt];
}

class _WeatherMainResponse extends Equatable implements IInfraResponse {
  final double? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;

  const _WeatherMainResponse({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
  });

  factory _WeatherMainResponse.fromJson(Map<String, dynamic> json) {
    return _WeatherMainResponse(
      temp: json['temp'] == null ? null : double.tryParse(json['temp'].toString()),
      feelsLike: json['feels_like'] == null ? null : double.tryParse(json['feels_like'].toString()),
      tempMin: json['temp_min'] == null ? null : double.tryParse(json['temp_min'].toString()),
      tempMax: json['temp_max'] == null ? null : double.tryParse(json['temp_max'].toString()),
    );
  }

  @override
  List<Object?> get props => [temp, feelsLike, tempMin, tempMax];
}

class _WeatherWeatherResponse extends Equatable implements IInfraResponse {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  const _WeatherWeatherResponse({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory _WeatherWeatherResponse.fromJson(Map<String, dynamic> json) {
    return _WeatherWeatherResponse(
      id: json['id'] == null ? null : int.tryParse(json['id'].toString()),
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }

  @override
  List<Object?> get props => [id, main, description, icon];
}
