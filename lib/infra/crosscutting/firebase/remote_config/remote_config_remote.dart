import 'package:firebase_remote_config/firebase_remote_config.dart';

import './interfaces/i_remote_config_remote.dart';
import 'package:poc_flutter_clean_repository/services/exceptions/remote_config_exception.dart';

class RemoteConfigRemote implements IRemoteConfigRemote {
  RemoteConfig _remoteConfig;

  @override
  Future<void> init(bool syncSecretsOnInit) async {
    _remoteConfig = await RemoteConfig.instance;

    if (syncSecretsOnInit) {
      await fetchSecrets();
    }
  }

  @override
  Future<void> fetchSecrets() async {
    if (_remoteConfig == null) {
      throw Exception("You must call init on this class, before fetching the secrets");
    }

    try {
      Duration cacheDuration = Duration(seconds: Duration(days: 30).inSeconds);

      //if (ConectividadeServiceSingleton.instancia.possuiConexao) {
      await _remoteConfig.fetch(expiration: Duration(seconds: 0)); //Force the search into remote_config, in order to fetch the updated version
      await _remoteConfig.fetch(expiration: cacheDuration);
      //}
      await _remoteConfig.activateFetched();

      DateTime ultimoSincronismo = _remoteConfig.lastFetchTime.toUtc();
      Duration diff = DateTime.now().toUtc().difference(ultimoSincronismo);

      //If we detect that the cache is expired, thern a specific Exception is throwed
      if (diff.inSeconds > cacheDuration.inSeconds) {
        throw RemoteConfigExpiredException(errorMessage: "Os dados de cache do Remote Config expiraram.");
      }
    } on FetchThrottledException catch (_) {
      //I will not be returnet any exceptionm because is a spected exception in the case of many requisitions are startes in remote config, as documentation said:https://firebase.google.com/docs/remote-config/use-config-android#throttling
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<Map<String, String>> getAllSecrets() async {
    if (_remoteConfig == null) {
      await fetchSecrets();
    }

    Map<String, String> remoteSecrets = Map<String, String>();
    _remoteConfig.getAll().forEach((key, valor) => remoteSecrets[key] = valor.asString());

    return remoteSecrets;
  }

  @override
  Future<String> getSecretFromKey(String key) async {
    if (_remoteConfig == null) {
      await fetchSecrets();
    }

    return _remoteConfig.getString(key);
  }
}
