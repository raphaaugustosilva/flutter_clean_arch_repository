import 'package:meta/meta.dart';

import 'package:poc_flutter_clean_repository/domain/entities/order/order_entity.dart';

class OrderResponse extends OrderEntity {
  final String id;
  final String title;
  final double total;
  final String customerName;

  OrderResponse({
    @required this.id,
    @required this.title,
    @required this.total,
    @required this.customerName,
  });

  factory OrderResponse.fromJson(Map json) {
    if (!json.keys.toSet().containsAll(['id', 'title', 'total', 'customerName'])) {
      throw Exception("Dados inválidos");
    }
    return OrderResponse(
      id: json['id'],
      title: json['title'],
      total: json['total'],
      customerName: json['customerName'],
    );
  }

  OrderEntity toEntity() => OrderEntity(
        id: id,
        title: title,
        total: total,
      );
}
