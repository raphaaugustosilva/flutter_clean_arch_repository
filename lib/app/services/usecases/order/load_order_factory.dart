import '../../../factories/infra/crosscutting/microservice_xpto/order/load_order_remote_factory.dart';
import '../../../factories/infra/repositories/order/order_repository_factory.dart';
import 'package:poc_flutter_clean_repository/domain/repositories/i_order_repository.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/order/i_load_order.dart';
import 'package:poc_flutter_clean_repository/infra/crosscutting/microservice_xpto/order/interfaces/i_load_order_remote.dart';
import 'package:poc_flutter_clean_repository/services/usecases/order/load_order.dart';

ILoadOrder makeLoadOrder() {
  IOrderRepository orderRepository = makeOrderRepository();
  ILoadOrderRemote loadOrderRemote = makeLoadOrderRemote();
  return LoadOrder(orderRepository: orderRepository, loadOrderRemote: loadOrderRemote);
}
