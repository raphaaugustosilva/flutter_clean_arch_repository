import '../../factories.dart';
import '../../../utils/app_config/app_config.dart';
import 'package:poc_flutter_clean_repository/data/repositories/repositories.dart';

AppConfig makeAppConfig() {
  ISecureDataRepository secureDataRepository = makeSecureDataRepository();
  return AppConfig(secureDataRepository: secureDataRepository);
}
