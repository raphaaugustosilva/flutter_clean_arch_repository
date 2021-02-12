import 'package:poc_flutter_clean_repository/domain/entities/order/order_entity.dart';

abstract class ILoadOrder {
  Future<List<OrderEntity>> load();
}
