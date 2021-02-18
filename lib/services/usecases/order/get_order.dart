import 'package:meta/meta.dart';

import 'package:poc_flutter_clean_repository/crosscutting/microservice_xpto/order/interfaces/i_xpto_order.dart';
import 'package:poc_flutter_clean_repository/crosscutting/microservice_xpto/order/models/get_xpto_order_response.dart';
import 'package:poc_flutter_clean_repository/domain/entities/order/order.dart';
import 'package:poc_flutter_clean_repository/domain/repositories/i_order_repository.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/order/i_get_order.dart';
import 'package:poc_flutter_clean_repository/services/extensions/xpto_extensions.dart';

class GetOrder implements IGetOrder {
  IOrderRepository orderRepository;
  IXptoOrder xptoOrder;

  GetOrder({@required this.orderRepository, @required this.xptoOrder});

  @override
  Future<List<Order>> execute() async {
    try {
      List<GetXptoOrderResponse> getOrdersResponse = await xptoOrder.getOrders();
      List<Order> result = getOrdersResponse.map((e) => e.toOrder()).toList();
      return result;
    } catch (e) {
      return await orderRepository.load();
    }
  }
}
