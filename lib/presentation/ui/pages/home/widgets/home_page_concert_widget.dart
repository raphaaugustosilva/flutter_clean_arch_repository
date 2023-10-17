import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:weather_forecast/domain/models/concert_model.dart';
import 'package:weather_forecast/presentation/theme/app_theme_texts.dart';
import 'package:weather_forecast/presentation/theme/app_theme_colors.dart';
import 'package:weather_forecast/presentation/presenters/home/home_presenter.dart';

class HomePageConcertWidget extends StatelessWidget {
  final HomePresenter presenter;
  final ConcertModel concert;
  const HomePageConcertWidget(this.presenter, {super.key, required this.concert});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => presenter.navigateToWeatherDetail(concert),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat("MM/dd/yyyy").format(concert.date),
                        overflow: TextOverflow.ellipsis,
                        style: AppThemeTexts(context).bodySmall(color: AppThemeColors.redDark.withOpacity(0.9)),
                      ),
                      Text(concert.city, overflow: TextOverflow.ellipsis),
                    ],
                  ),
                  subtitle: Text(concert.country, overflow: TextOverflow.ellipsis),
                ),
              ),
              Text(
                "Check weather >",
                style: AppThemeTexts(context).headingSmall(color: AppThemeColors.blue),
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
