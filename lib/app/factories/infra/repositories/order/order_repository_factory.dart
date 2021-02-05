import 'package:poc_flutter_clean_repository/domain/repositories/i_order_repository.dart';
import 'package:poc_flutter_clean_repository/infra/repositories/order/order_repository.dart';

IOrderRepository makeOrderRepository() => OrderRepository();
