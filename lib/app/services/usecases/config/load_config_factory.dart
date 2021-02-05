import '../../../factories/infra/crosscutting/firebase/remote_config/remote_config_remote_factory.dart';
import '../../../factories/infra/repositories/secure_data/secure_data_repository_factory.dart';
import 'package:poc_flutter_clean_repository/domain/repositories/i_secure_data_repository.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/config/i_load_config.dart';
import 'package:poc_flutter_clean_repository/services/usecases/config/load_config.dart';
import 'package:poc_flutter_clean_repository/infra/crosscutting/firebase/remote_config/interfaces/i_remote_config_remote.dart';

ILoadConfig makeLoadConfig() {
  ISecureDataRepository secureDataRepository = makeSecureDataRepository();
  IRemoteConfigRemote remoteConfigRemote = makeRemoteConfigRemote();
  return LoadConfig(secureDataRepository: secureDataRepository, remoteConfigRemote: remoteConfigRemote);
}
