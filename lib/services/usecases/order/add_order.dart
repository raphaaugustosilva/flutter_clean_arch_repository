import 'package:meta/meta.dart';

import 'package:poc_flutter_clean_repository/crosscutting/microservice_xpto/order/interfaces/i_xpto_order.dart';
import 'package:poc_flutter_clean_repository/crosscutting/microservice_xpto/order/models/get_xpto_order_response.dart';
import 'package:poc_flutter_clean_repository/crosscutting/microservice_xpto/order/models/post_xpto_order_request.dart';
import 'package:poc_flutter_clean_repository/domain/entities/order/order.dart';
import 'package:poc_flutter_clean_repository/domain/repositories/i_order_repository.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/order/i_add_order.dart';
import 'package:poc_flutter_clean_repository/services/extensions/xpto_extensions.dart';

class AddOrder implements IAddOrder {
  IOrderRepository orderRepository;
  IXptoOrder xptoOrder;

  AddOrder({@required this.orderRepository, @required this.xptoOrder});

  @override
  Future<Order> execute() async {
    try {
      GetXptoOrderResponse getOrderResponse = await xptoOrder.postOrder(PostXptoOrderRequest(id: "guid_post_01", title: "Teste de post", total: 100, customerName: "Rapha"));
      Order result = getOrderResponse.toOrder();
      return result;
    } catch (e) {
      Order result = await orderRepository.add(Order(id: "guid_local_teste_01", title: "Teste order local", total: 200, isSynchronized: false));
      return result;
    }
  }
}
