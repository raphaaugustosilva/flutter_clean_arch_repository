import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weather_forecast/presentation/theme/app_theme_colors.dart';
import 'package:weather_forecast/presentation/ui/assets/images/app_images.dart';
import 'package:weather_forecast/presentation/ui/components/loader_component.dart';
import 'package:weather_forecast/presentation/presenters/splash/splash_presenter.dart';
import 'package:weather_forecast/presentation/ui/components/generic_error_component.dart';

class SplashPage extends StatelessWidget {
  static String route = "splash-page";
  SplashPage({super.key});
  final SplashPresenter presenter = GetIt.I.get<SplashPresenter>();

  @override
  Widget build(BuildContext context) {
    presenter.init();

    return Scaffold(
      backgroundColor: AppThemeColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: Observer(builder: (_) {
            return presenter.hasError
                ? GenericErrorComponent(
                    errorText: presenter.errorText,
                    tryAgainFunction: () => presenter.init(),
                  )
                : FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 60),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80),
                          child: Image.asset(
                            EAppImages.logoLight.path(),
                          ),
                        ),
                        const LoaderComponent(
                          style: ELoaderComponentStyle.dark,
                          size: 60,
                        ),
                      ],
                    ),
                  );
          }),
        ),
      ),
    );
  }
}
