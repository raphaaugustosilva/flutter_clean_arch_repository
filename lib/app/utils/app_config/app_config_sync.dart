import 'config_keys.dart';
import 'package:poc_flutter_clean_repository/domain/repositories/i_secure_data_repository.dart';

class AppSync {
  final ISecureDataRepository secureDataRepository;
  AppSync(this.secureDataRepository);

  int syncPeriodicityInSeconds;

  Future loadSecureConfigs() async {
    syncPeriodicityInSeconds = int.tryParse(await secureDataRepository.get(ConfigKeys.SYNC_PERIODICITY_IN_SECONDS));
  }
}
