import './config_keys.dart';

class LocalConfigSecrets {
  static Map<String, dynamic> secrets() {
    return {
      //Sincronização
      ConfigKeys.SYNC_PERIODICITY_IN_SECONDS: "10",

      //Vitrine
      ConfigKeys.ACTIVATION_TITLE: "Teste de título Vitrine",
      ConfigKeys.ACTIVATION_TEXT: "Texto Teste Vitrine",
    };
  }
}
