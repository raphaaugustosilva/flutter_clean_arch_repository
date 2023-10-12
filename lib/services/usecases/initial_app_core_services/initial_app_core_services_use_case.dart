import 'package:weather_forecast/domain/infra/remote_config/i_remote_config.dart';
import 'package:weather_forecast/domain/services/usecases/configurations/i_configurations_api_set_use_case.dart';
import 'package:weather_forecast/domain/services/usecases/initial_app_core_services/i_initial_app_core_services_use_case.dart';

class InitialAppCoreServicesUseCase implements IInitialAppCoreServicesUseCase {
  final IRemoteConfig remoteConfig;
  final IConfigurationsApiSetUseCase configurationsApiSetUseCase;
  InitialAppCoreServicesUseCase({required this.remoteConfig, required this.configurationsApiSetUseCase});

  bool _isInitialized = false;

  @override
  Future<void> execute() async {
    if (!_isInitialized) {
      await remoteConfig.init(true);
      await configurationsApiSetUseCase.execute();
    }

    _isInitialized = true;
  }
}
