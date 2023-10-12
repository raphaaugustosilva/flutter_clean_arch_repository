import 'package:get_it/get_it.dart';
import 'package:weather_forecast/app/di/i_di_feature.dart';
import 'package:weather_forecast/domain/infra/remote_config/i_remote_config.dart';
import 'package:weather_forecast/domain/infra/repositories/i_concert_repository.dart';
import 'package:weather_forecast/infra/firebase/remote_config/remote_config.dart';
import 'package:weather_forecast/domain/services/usecases/connection/i_connection_internet_check_use_case.dart';
import 'package:weather_forecast/infra/repositories/local_storage/concert_repository.dart';

class DIInfra implements IDIFeature {
  @override
  Future<void> configureInjection() async {
    GetIt getIt = GetIt.instance;

    getIt.registerLazySingleton<IRemoteConfig>(() => RemoteConfig(
          connectionInternetCheckUseCase: getIt.get<IConnectionInternetCheckUseCase>(),
        ));

    getIt.registerLazySingleton<IConcertRepository>(() => ConcertRepository());
  }
}
