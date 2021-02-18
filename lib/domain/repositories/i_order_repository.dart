import 'package:poc_flutter_clean_repository/domain/entities/order/order.dart';

abstract class IOrderRepository {
  Future<List<Order>> load();
  Future<Order> add(Order order);
}
