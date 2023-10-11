import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:weather_forecast/domain/infra/remote_config/i_remote_config.dart';
import 'package:weather_forecast/domain/services/usecases/connection/i_connection_internet_check_use_case.dart';

class RemoteConfig implements IRemoteConfig {
  final IConnectionInternetCheckUseCase connectionInternetCheckUseCase;
  RemoteConfig({required this.connectionInternetCheckUseCase});

  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;
  bool _isInitialized = false;

  @override
  Future<void> init(bool syncSecretsOnInit) async {
    if (syncSecretsOnInit) {
      await fetchSecrets();
    }
  }

  @override
  Future<bool> fetchSecrets() async {
    Duration cacheDuration = const Duration(hours: 4);

    await _remoteConfig.setConfigSettings(RemoteConfigSettings(fetchTimeout: const Duration(seconds: 20), minimumFetchInterval: cacheDuration));

    if (await connectionInternetCheckUseCase.execute()) {
      await _remoteConfig.fetch();
    }
    await _remoteConfig.activate();
    await _remoteConfig.ensureInitialized();
    _isInitialized = true;
    return true;
  }

  @override
  Future<Map<String, String>> getAllSecrets() async {
    if (!_isInitialized) await fetchSecrets();

    Map<String, String> remoteSecrets = <String, String>{};
    _remoteConfig.getAll().forEach((key, valor) => remoteSecrets[key] = valor.asString());
    return remoteSecrets;
  }

  @override
  Future<String> getSecretFromKey(String key) async {
    if (!_isInitialized) await fetchSecrets();
    return _remoteConfig.getString(key);
  }
}
