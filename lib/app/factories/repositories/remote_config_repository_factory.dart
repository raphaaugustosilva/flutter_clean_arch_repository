import 'package:poc_flutter_clean_repository/services/repositories/repositories.dart';
import 'package:poc_flutter_clean_repository/infra/repository/repository.dart';

IRemoteConfigRepository makeRemoteConfigRepository() => RemoteConfigRemote();
