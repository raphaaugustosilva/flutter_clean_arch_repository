import 'package:meta/meta.dart';

import './config_keys.dart';
import 'package:poc_flutter_clean_repository/domain/repositories/i_secure_data_repository.dart';

class AppConfig {
  final ISecureDataRepository secureDataRepository;
  AppConfig({@required this.secureDataRepository});

  int syncPeriodicityInSeconds;
  String activationTitle;
  String activationText;

  Future init() async {
    syncPeriodicityInSeconds = int.tryParse(await secureDataRepository.getFromKey(ConfigKeys.SYNC_PERIODICITY_IN_SECONDS));
    activationTitle = await secureDataRepository.getFromKey(ConfigKeys.ACTIVATION_TITLE);
    activationText = await secureDataRepository.getFromKey(ConfigKeys.ACTIVATION_TEXT);
  }
}
