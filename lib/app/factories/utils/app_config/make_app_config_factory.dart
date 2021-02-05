import '../../../utils/app_config/app_config.dart';
import 'package:poc_flutter_clean_repository/domain/repositories/i_secure_data_repository.dart';
import 'package:poc_flutter_clean_repository/app/factories/infra/repositories/secure_data/secure_data_repository_factory.dart';

AppConfig makeAppConfig() {
  ISecureDataRepository secureDataRepository = makeSecureDataRepository();
  return AppConfig(secureDataRepository: secureDataRepository);
}
