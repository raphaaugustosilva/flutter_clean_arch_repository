import 'package:meta/meta.dart';

import 'app_config_sync.dart';
import 'app_config_showcase.dart';
import 'package:poc_flutter_clean_repository/domain/repositories/i_secure_data_repository.dart';

class AppConfig {
  final ISecureDataRepository secureDataRepository;

  AppSync synchronization;
  AppShowcase showcase;

  AppConfig({@required this.secureDataRepository}) {
    this.synchronization = AppSync(this.secureDataRepository);
    this.showcase = AppShowcase(this.secureDataRepository);
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
