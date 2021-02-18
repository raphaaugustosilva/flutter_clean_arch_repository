import 'package:poc_flutter_clean_repository/domain/entities/order/order.dart';

abstract class IGetOrder {
  Future<List<Order>> execute();
}
