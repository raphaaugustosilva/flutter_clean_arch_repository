import 'package:poc_flutter_clean_repository/crosscutting/microservice_xpto/order/models/get_xpto_order_response.dart';
import 'package:poc_flutter_clean_repository/domain/entities/order/order.dart';

extension GetXptoOrderResponseExtension on GetXptoOrderResponse {
  Order toOrder() {
    GetXptoOrderResponse response = this;

    return Order(
      id: response.id,
      title: response.title,
      total: response.total,
    );
  }
}
