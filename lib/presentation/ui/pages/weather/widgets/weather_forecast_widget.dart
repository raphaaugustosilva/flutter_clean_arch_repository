import 'package:flutter/material.dart';
import 'package:weather_forecast/presentation/theme/theme.dart';
import 'package:weather_forecast/domain/models/weather_model.dart';
import 'package:weather_forecast/presentation/presenters/weather/weather_presenter.dart';
import 'package:weather_forecast/presentation/ui/pages/weather/widgets/weather_card_widget.dart';

class WeatherForecastWidget extends StatelessWidget {
  final WeatherPresenter presenter;
  const WeatherForecastWidget(this.presenter, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("NEXT 5 DAYS", style: AppThemeTexts(context).subtitle()?.w800),
        const SizedBox(height: 10),
        SizedBox(
          width: 200,
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: presenter.weatherForecastList.length,
              itemBuilder: (_, index) {
                WeatherModel weatherModel = presenter.weatherForecastList[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: WeatherCardWidget(weather: weatherModel),
                );
              }),
        ),
      ],
    );
  }
}
