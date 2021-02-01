import 'package:poc_flutter_clean_repository/data/repositories/repositories.dart';
import 'package:poc_flutter_clean_repository/data/usecases/usecases.dart';
import 'package:poc_flutter_clean_repository/infra/repository/repository.dart';
import 'package:poc_flutter_clean_repository/app/factories/usecases/usecases.dart';

IOrderRepository makeOrderRepository() {
  ILoadOrderRemote loadOrderRemote = makeLoadOrderRemote();
  ILoadOrderLocal loadOrderLocal = makeLoadOrderLocal();

  return OrderRepository(loadOrderRemote: loadOrderRemote, loadOrderLocal: loadOrderLocal);
}
