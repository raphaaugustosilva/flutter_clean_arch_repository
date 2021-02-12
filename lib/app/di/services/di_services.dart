import 'package:get_it/get_it.dart';

import 'package:poc_flutter_clean_repository/domain/repositories/i_order_repository.dart';
import 'package:poc_flutter_clean_repository/domain/repositories/i_secure_data_repository.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/config/i_load_config.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/order/i_add_order.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/order/i_load_order.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/secure_data/i_add_map_secure_data.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/secure_data/i_add_secure_data.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/secure_data/i_delete_all_secure_data.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/secure_data/i_delete_secure_data.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/secure_data/i_get_all_secure_data.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/secure_data/i_get_secure_data.dart';
import 'package:poc_flutter_clean_repository/app/di/i_di_feature.dart';
import 'package:poc_flutter_clean_repository/crosscutting/microservice_xpto/order/interfaces/i_add_order_remote.dart';
import 'package:poc_flutter_clean_repository/crosscutting/microservice_xpto/order/interfaces/i_load_order_remote.dart';
import 'package:poc_flutter_clean_repository/crosscutting/firebase/remote_config/interfaces/i_remote_config_remote.dart';
import 'package:poc_flutter_clean_repository/services/usecases/config/load_config.dart';
import 'package:poc_flutter_clean_repository/services/usecases/order/add_order.dart';
import 'package:poc_flutter_clean_repository/services/usecases/order/load_order.dart';
import 'package:poc_flutter_clean_repository/services/usecases/secure_data/add_map_secure_data.dart';
import 'package:poc_flutter_clean_repository/services/usecases/secure_data/add_secure_data.dart';
import 'package:poc_flutter_clean_repository/services/usecases/secure_data/delete_all_secure_data.dart';
import 'package:poc_flutter_clean_repository/services/usecases/secure_data/delete_secure_data.dart';
import 'package:poc_flutter_clean_repository/services/usecases/secure_data/load_all_secure_data.dart';
import 'package:poc_flutter_clean_repository/services/usecases/secure_data/load_secure_data.dart';

class DIServices implements IDIFeature {
  @override
  Future<void> configureInjection() async {
    GetIt getIt = GetIt.instance;

    getIt.registerLazySingleton<ILoadConfig>(() {
      return LoadConfig(
        secureDataRepository: GetIt.instance.get<ISecureDataRepository>(),
        remoteConfigRemote: GetIt.instance.get<IRemoteConfigRemote>(),
      );
    });

    getIt.registerLazySingleton<ILoadOrder>(() {
      return LoadOrder(
        orderRepository: GetIt.instance.get<IOrderRepository>(),
        loadOrderRemote: GetIt.instance.get<ILoadOrderRemote>(),
      );
    });

    getIt.registerLazySingleton<IAddOrder>(() {
      return AddOrder(
        addOrderRemote: GetIt.instance.get<IAddOrderRemote>(),
      );
    });

    getIt.registerLazySingleton<IAddMapSecureData>(() {
      return AddMapSecureData(
        secureDataRepository: GetIt.instance.get<ISecureDataRepository>(),
      );
    });

    getIt.registerLazySingleton<IAddSecureData>(() {
      return AddSecureData(
        secureDataRepository: GetIt.instance.get<ISecureDataRepository>(),
      );
    });

    getIt.registerLazySingleton<IDeleteAllSecureData>(() {
      return DeleteAllSecureData(
        secureDataRepository: GetIt.instance.get<ISecureDataRepository>(),
      );
    });

    getIt.registerLazySingleton<IDeleteSecureData>(() {
      return DeleteSecureData(
        secureDataRepository: GetIt.instance.get<ISecureDataRepository>(),
      );
    });

    getIt.registerLazySingleton<IGetAllSecureData>(() {
      return GetAllSecureData(
        secureDataRepository: GetIt.instance.get<ISecureDataRepository>(),
      );
    });

    getIt.registerLazySingleton<IGetSecureData>(() {
      return GetSecureData(
        secureDataRepository: GetIt.instance.get<ISecureDataRepository>(),
      );
    });
  }
}
