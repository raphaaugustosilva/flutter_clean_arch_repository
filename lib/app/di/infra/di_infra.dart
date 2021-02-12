import 'package:get_it/get_it.dart';

import 'package:poc_flutter_clean_repository/domain/repositories/i_order_repository.dart';
import 'package:poc_flutter_clean_repository/domain/repositories/i_secure_data_repository.dart';
import 'package:poc_flutter_clean_repository/app/di/i_di_feature.dart';
import 'package:poc_flutter_clean_repository/infra/repositories/order/order_repository.dart';
import 'package:poc_flutter_clean_repository/infra/repositories/secure_data/secure_data_repository.dart';

class DIInfra implements IDIFeature {
  @override
  Future<void> configureInjection() async {
    GetIt getIt = GetIt.instance;

    getIt.registerLazySingleton<ISecureDataRepository>(() => SecureDataRepository());
    getIt.registerLazySingleton<IOrderRepository>(() => OrderRepository());
  }
}
