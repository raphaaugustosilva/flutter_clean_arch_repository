import 'package:meta/meta.dart';

import 'package:poc_flutter_clean_repository/domain/entities/order/order.dart';

class PostXptoOrderRequest extends Order {
  final String id;
  final String title;
  final double total;
  final String customerName;

  PostXptoOrderRequest({@required this.id, @required this.title, @required this.total, @required this.customerName});

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "total": total,
        "customerName": customerName,
      };
}
