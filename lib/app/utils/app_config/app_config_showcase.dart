import 'config_keys.dart';
import 'package:poc_flutter_clean_repository/domain/repositories/i_secure_data_repository.dart';

class AppShowcase {
  final ISecureDataRepository secureDataRepository;
  AppShowcase(this.secureDataRepository);

  //Vitrine Virutal
  String activationTitle;
  String activationText;

  Future loadSecureConfigs() async {
    activationTitle = await secureDataRepository.get(ConfigKeys.ACTIVATION_TITLE);
    activationText = await secureDataRepository.get(ConfigKeys.ACTIVATION_TEXT);
  }
}