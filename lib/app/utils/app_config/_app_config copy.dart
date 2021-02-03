import 'package:meta/meta.dart';

import 'config_keys.dart';
import 'package:poc_flutter_clean_repository/domain/repositories/i_secure_data_repository.dart';

class AppConfigbkp {
  final ISecureDataRepository secureDataRepository;

  _AppSync synchronization;
  _AppShowcase showcase;

  AppConfigbkp({@required this.secureDataRepository}) {
    this.synchronization = _AppSync(this.secureDataRepository);
    this.showcase = _AppShowcase(this.secureDataRepository);
  }

  Future init() async {
    await synchronization.loadSecureConfigs();
    await showcase.loadSecureConfigs();
  }

  @override
  String toString() {
    return "syncPeriodicityInSeconds : ${synchronization.syncPeriodicityInSeconds} \n"
        "activationTitle : ${showcase.activationTitle} \n"
        "activationText : ${showcase.activationText} \n";
  }
}

class _AppSync {
  final ISecureDataRepository secureDataRepository;
  _AppSync(this.secureDataRepository);

  int syncPeriodicityInSeconds;

  Future loadSecureConfigs() async {
    syncPeriodicityInSeconds = int.tryParse(await secureDataRepository.getFromKey(ConfigKeys.SYNC_PERIODICITY_IN_SECONDS));
  }
}

class _AppShowcase {
  final ISecureDataRepository secureDataRepository;
  _AppShowcase(this.secureDataRepository);

  //Vitrine Virutal
  String activationTitle;
  String activationText;

  Future loadSecureConfigs() async {
    activationTitle = await secureDataRepository.getFromKey(ConfigKeys.ACTIVATION_TITLE);
    activationText = await secureDataRepository.getFromKey(ConfigKeys.ACTIVATION_TEXT);
  }
}
