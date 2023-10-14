import 'package:flutter/material.dart';
import 'package:weather_forecast/presentation/theme/theme.dart';
import 'package:weather_forecast/presentation/presenters/weather/weather_presenter.dart';
import 'package:weather_forecast/presentation/ui/pages/weather/widgets/weather_card_widget.dart';

class WeatherNowWidget extends StatelessWidget {
  final WeatherPresenter presenter;
  const WeatherNowWidget(this.presenter, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text("NOW", style: AppThemeTexts(context).subtitle()?.w800),
      const SizedBox(height: 10),
      WeatherCardWidget(weather: presenter.weatherCurrent),
    ]);
  }
}
