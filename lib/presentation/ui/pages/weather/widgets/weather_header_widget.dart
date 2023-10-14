import 'package:flutter/material.dart';
import 'package:weather_forecast/presentation/theme/theme.dart';
import 'package:weather_forecast/domain/models/concert_model.dart';

class WeatherHeaderWidget extends StatelessWidget {
  final ConcertModel concert;
  const WeatherHeaderWidget({super.key, required this.concert});

  @override
  Widget build(BuildContext context) {
    return Text(
      "${concert.city}, ${concert.country.toUpperCase()}",
      style: AppThemeTexts(context).title(color: AppThemeColors.redDark),
      textAlign: TextAlign.center,
    );
  }
}
