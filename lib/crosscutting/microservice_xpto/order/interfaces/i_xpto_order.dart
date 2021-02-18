import 'package:poc_flutter_clean_repository/crosscutting/microservice_xpto/order/models/get_xpto_order_response.dart';
import 'package:poc_flutter_clean_repository/crosscutting/microservice_xpto/order/models/post_xpto_order_request.dart';

abstract class IXptoOrder {
  Future<List<GetXptoOrderResponse>> getOrders();
  Future<GetXptoOrderResponse> postOrder(PostXptoOrderRequest request);
}
