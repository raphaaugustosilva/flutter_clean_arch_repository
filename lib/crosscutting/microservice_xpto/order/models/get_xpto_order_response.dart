import 'package:meta/meta.dart';

import 'package:poc_flutter_clean_repository/domain/entities/order/order.dart';

class GetXptoOrderResponse extends Order {
  final String id;
  final String title;
  final double total;
  final String customerName;

  GetXptoOrderResponse({@required this.id, @required this.title, @required this.total, @required this.customerName});

  factory GetXptoOrderResponse.fromJson(Map json) {
    if (!json.keys.toSet().containsAll(['id', 'title', 'total', 'customerName'])) {
      throw Exception("Dados inválidos");
    }
    return GetXptoOrderResponse(
      id: json['id'],
      title: json['title'],
      total: json['total'],
      customerName: json['customerName'],
    );
  }
}
