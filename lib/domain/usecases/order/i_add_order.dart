import 'package:poc_flutter_clean_repository/domain/entities/order/order.dart';

abstract class IAddOrder {
  Future<Order> execute();
}
