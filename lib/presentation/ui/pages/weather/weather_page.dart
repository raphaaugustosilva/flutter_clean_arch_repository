import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weather_forecast/domain/models/concert_model.dart';
import 'package:weather_forecast/presentation/theme/app_theme.dart';
import 'package:weather_forecast/presentation/theme/app_theme_texts.dart';
import 'package:weather_forecast/presentation/theme/app_theme_colors.dart';
import 'package:weather_forecast/presentation/ui/components/loader_component.dart';
import 'package:weather_forecast/presentation/presenters/weather/weather_presenter.dart';
import 'package:weather_forecast/presentation/ui/components/generic_error_component.dart';
import 'package:weather_forecast/presentation/ui/pages/weather/widgets/weather_now_widget.dart';
import 'package:weather_forecast/presentation/ui/pages/weather/widgets/weather_header_widget.dart';
import 'package:weather_forecast/presentation/ui/pages/weather/widgets/weather_forecast_widget.dart';

class WeatherPageArgs {
  final ConcertModel concert;
  const WeatherPageArgs({required this.concert});
}

class WeatherPage extends StatefulWidget {
  static String route = 'weather-page';
  final WeatherPageArgs arguments;
  const WeatherPage({super.key, required this.arguments});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final WeatherPresenter presenter = GetIt.I.get<WeatherPresenter>();

  @override
  void initState() {
    presenter.init(widget.arguments.concert);
    presenter.getWeatherDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppThemeColors.redDark,
        foregroundColor: AppThemeColors.white,
        title: Text("WEATHER DETAILS", style: AppThemeTexts(context).subtitle(color: AppThemeColors.white)),
      ),
      body: Padding(
        padding: AppTheme.defaultScreenPadding,
        child: Observer(builder: (_) {
          return presenter.isLoading
              ? const LoaderComponent(type: ELoaderType.animation, style: ELoaderComponentStyle.dark, loadingText: "Please wait, checking the weather")
              : presenter.hasError
                  ? Center(
                      child: GenericErrorComponent(
                        errorText: presenter.errorText,
                        tryAgainFunction: () => presenter.getWeatherDetails(),
                      ),
                    )
                  : SingleChildScrollView(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            WeatherHeaderWidget(concert: widget.arguments.concert),
                            const SizedBox(height: 30),
                            WeatherNowWidget(presenter),
                            const SizedBox(height: 50),
                            WeatherForecastWidget(presenter),
                          ],
                        ),
                      ),
                    );
        }),
      ),
    );
  }
}
