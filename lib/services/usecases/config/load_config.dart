import 'package:flutter/foundation.dart';

import 'package:poc_flutter_clean_repository/domain/repositories/i_secure_data_repository.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/config/i_load_config.dart';
import 'package:poc_flutter_clean_repository/app/utils/app_config/config_keys.dart';
import 'package:poc_flutter_clean_repository/app/utils/app_config/local_config_secrets.dart';
import 'package:poc_flutter_clean_repository/crosscutting/firebase/remote_config/interfaces/i_remote_config_remote.dart';

class LoadConfig implements ILoadConfig {
  final ISecureDataRepository secureDataRepository;
  final IRemoteConfigRemote remoteConfigRemote;

  LoadConfig({@required this.secureDataRepository, @required this.remoteConfigRemote});

  @override
  Future<void> execute() async {
    try {
      Map<String, String> mapConfigsKeyValue = Map<String, String>();

      //If is release mode, then the secret will be fetched from Firebase Remote Config.
      if (kReleaseMode) {
        //Instantiate and prepare Firebase Remote Config
        await remoteConfigRemote.init(true);

        for (String key in ConfigKeys.keys) {
          //Search for the key`s value from Firebase Remote Config
          mapConfigsKeyValue[key] = await remoteConfigRemote.getSecretFromKey(key);
        }
      } else {
        //Otherwise, It`ll be fetched from developer local file.
        ConfigKeys.keys.forEach((key) {
          mapConfigsKeyValue[key] = LocalConfigSecrets.secrets()[key];
        });
      }

      //Now stores in the device`s secure area (keystore and keychain)
      await secureDataRepository.deleteAll();
      await secureDataRepository.addMap(mapConfigsKeyValue);
    } catch (e) {
      print("Erro ao recuperar as configurações seguras do app. Detalhes: $e");
    }
  }
}
