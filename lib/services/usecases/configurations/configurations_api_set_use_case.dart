import 'package:weather_forecast/app/environment/environment.dart';
import 'package:weather_forecast/domain/infra/remote_config/i_remote_config.dart';
import 'package:weather_forecast/infra/firebase/remote_config/remote_config_keys.dart';
import 'package:weather_forecast/domain/services/usecases/configurations/i_configurations_api_set_use_case.dart';

class ConfigurationsApiSetUseCase implements IConfigurationsApiSetUseCase {
  final IRemoteConfig remoteConfig;
  const ConfigurationsApiSetUseCase({required this.remoteConfig});

  @override
  Future<void> execute() async {
    String weatherApiUrl = await remoteConfig.getSecretFromKey(RemoteConfigKeys.weatherApiUrl);
    String weatherApiKey = await remoteConfig.getSecretFromKey(RemoteConfigKeys.weatherApiKey);
    Environment.instance.config.setApiConfig(apiUrl: weatherApiUrl, apiKey: weatherApiKey);
  }
}
