import '../entities/order/order_entity.dart';

abstract class IOrderRepository {
  Future<List<OrderEntity>> load();
  Future<void> add(OrderEntity order);
}
