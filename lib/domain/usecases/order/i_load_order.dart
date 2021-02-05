import '../../entities/order/order_entity.dart';

abstract class ILoadOrder {
  Future<List<OrderEntity>> load();
}
