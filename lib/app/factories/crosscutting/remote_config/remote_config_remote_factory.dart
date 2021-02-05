import 'package:poc_flutter_clean_repository/crosscutting/remote/remote_config/i_remote_config_remote.dart';
import 'package:poc_flutter_clean_repository/infra/remote/remote_config/remote_config_remote.dart';

IRemoteConfigRemote makeRemoteConfigRemote() => RemoteConfigRemote();