import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:weather_forecast/domain/models/weather_model.dart';
import 'package:weather_forecast/presentation/theme/app_theme_texts.dart';
import 'package:weather_forecast/presentation/theme/app_theme_colors.dart';

class WeatherCardWidget extends StatelessWidget {
  final WeatherModel? weather;
  final bool showDate;
  const WeatherCardWidget({super.key, required this.weather, this.showDate = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: AppThemeColors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            if (showDate && weather?.dateTime != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  DateFormat("MM/dd/yyyy - HH:mm").format(weather!.dateTime),
                  style: AppThemeTexts(context).body(color: AppThemeColors.white.withOpacity(0.7)),
                  textAlign: TextAlign.center,
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if ((weather?.icon ?? "").isNotEmpty) Image.asset('lib/presentation/ui/assets/images/png/weather_situations/${weather?.icon}.png', height: 40),
                Column(
                  children: [
                    Text("min: ${weather?.temperatureMin}", style: AppThemeTexts(context).headingSmall(color: AppThemeColors.white)),
                    Text("max: ${weather?.temperatureMax}", style: AppThemeTexts(context).headingSmall(color: AppThemeColors.white)),
                  ],
                ),
              ],
            ),
            Text("${weather?.temperatureCurrent} °F", style: AppThemeTexts(context).titleBig(color: AppThemeColors.white), textAlign: TextAlign.center),
            const SizedBox(height: 5),
            Text(weather?.summary ?? "", style: AppThemeTexts(context).subtitle(color: AppThemeColors.white), textAlign: TextAlign.center),
            const SizedBox(height: 10),
            Text(weather?.description ?? "", style: AppThemeTexts(context).bodySmall(color: AppThemeColors.white), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
