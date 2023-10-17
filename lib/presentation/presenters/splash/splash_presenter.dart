import 'package:weather_forecast/app/navigator/i_navigation.dart';
import 'package:weather_forecast/presentation/ui/pages/home/home_page.dart';
import 'package:weather_forecast/presentation/presenters/mobx_base_store.dart';
import 'package:weather_forecast/domain/services/usecases/initial_app_core_services/i_initial_app_transparency_use_case.dart';

class SplashPresenter extends MobxBaseStore {
  final INavigation navigation;
  final IInitialAppTransparencyUseCase initialAppTransparencyUseCase;

  SplashPresenter({
    required this.navigation,
    required this.initialAppTransparencyUseCase,
  });

  void goToHome() {
    navigation.replaceCurrentPageWith(HomePage.route);
  }

  Future<void> init() async {
    try {
      setHasError(false);
      await initialAppTransparencyUseCase.execute();
      goToHome();
    } catch (_) {
      setHasError(true);
    }
  }
}
