import 'package:get_it/get_it.dart';
import 'package:poc_flutter_clean_repository/crosscutting/microservice_xpto/order/interfaces/i_xpto_order.dart';

import 'package:poc_flutter_clean_repository/domain/repositories/i_order_repository.dart';
import 'package:poc_flutter_clean_repository/domain/repositories/i_secure_data_repository.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/config/i_load_config.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/order/i_add_order.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/order/i_get_order.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/secure_data/i_add_map_secure_data.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/secure_data/i_add_secure_data.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/secure_data/i_delete_all_secure_data.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/secure_data/i_delete_secure_data.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/secure_data/i_get_all_secure_data.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/secure_data/i_get_secure_data.dart';
import 'package:poc_flutter_clean_repository/app/di/i_di_feature.dart';
import 'package:poc_flutter_clean_repository/crosscutting/firebase/remote_config/interfaces/i_remote_config_remote.dart';
import 'package:poc_flutter_clean_repository/services/usecases/config/load_config.dart';
import 'package:poc_flutter_clean_repository/services/usecases/order/add_order.dart';
import 'package:poc_flutter_clean_repository/services/usecases/order/get_order.dart';
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

    getIt.registerLazySingleton<ILoadConfig>(() => LoadConfig(
          secureDataRepository: GetIt.instance.get<ISecureDataRepository>(),
          remoteConfigRemote: GetIt.instance.get<IRemoteConfigRemote>(),
        ));

    getIt.registerLazySingleton<IGetOrder>(() => GetOrder(
          orderRepository: GetIt.instance.get<IOrderRepository>(),
          xptoOrder: GetIt.instance.get<IXptoOrder>(),
        ));

    getIt.registerLazySingleton<IAddOrder>(() => AddOrder(
          orderRepository: GetIt.instance.get<IOrderRepository>(),
          xptoOrder: GetIt.instance.get<IXptoOrder>(),
        ));

    getIt.registerLazySingleton<IAddMapSecureData>(() => AddMapSecureData(secureDataRepository: GetIt.instance.get<ISecureDataRepository>()));

    getIt.registerLazySingleton<IAddSecureData>(() => AddSecureData(secureDataRepository: GetIt.instance.get<ISecureDataRepository>()));

    getIt.registerLazySingleton<IDeleteAllSecureData>(() => DeleteAllSecureData(secureDataRepository: GetIt.instance.get<ISecureDataRepository>()));

    getIt.registerLazySingleton<IDeleteSecureData>(() => DeleteSecureData(secureDataRepository: GetIt.instance.get<ISecureDataRepository>()));

    getIt.registerLazySingleton<IGetAllSecureData>(() => GetAllSecureData(secureDataRepository: GetIt.instance.get<ISecureDataRepository>()));

    getIt.registerLazySingleton<IGetSecureData>(() => GetSecureData(secureDataRepository: GetIt.instance.get<ISecureDataRepository>()));
  }
}
