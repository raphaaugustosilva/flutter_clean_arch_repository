import 'package:get_it/get_it.dart';
import 'package:weather_forecast/app/di/i_di_feature.dart';
import 'package:weather_forecast/app/environment/environment.dart';
import 'package:weather_forecast/app/environment/base_config/i_env_base_config.dart';

class DIApp implements IDIFeature {
  GetIt getIt = GetIt.instance;

  @override
  Future<void> configureInjection() async {
    GetIt getIt = GetIt.instance;

    getIt.registerSingleton<IEnvBaseConfig>(
      Environment.instance.config,
    );
  }
}
