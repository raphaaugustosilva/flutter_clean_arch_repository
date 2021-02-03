import 'package:poc_flutter_clean_repository/services/repositories/repositories.dart';
import 'package:poc_flutter_clean_repository/services/usecases/usecases.dart';
import 'package:poc_flutter_clean_repository/infra/repository/repository.dart';
import 'package:poc_flutter_clean_repository/app/factories/usecases/usecases.dart';

IOrderRepository makeOrderRepository() {
  ILoadOrderRemote loadOrderRemote = makeLoadOrderRemote();

  return OrderRepository(loadOrderRemote: loadOrderRemote);
}
