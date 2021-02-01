import 'package:meta/meta.dart';

import 'package:poc_flutter_clean_repository/domain/entities/entities.dart';

class OrderModel extends OrderEntity {
  final String id;
  final String title;
  final double total;
  final bool isSynchronized;

  OrderModel({@required this.id, @required this.title, @required this.total, this.isSynchronized});

  factory OrderModel.fromJson(Map json) {
    if (!json.keys.toSet().containsAll(['id', 'title', 'total', 'isSynchronized'])) {
      throw Exception("Dados inválidos");
    }
    return OrderModel(
      id: json['id'],
      title: json['title'],
      total: json['total'],
      isSynchronized: json['isSynchronized'] == null
          ? null
          : json['isSynchronized'] == "true"
              ? true
              : false,
    );
  }

  OrderEntity toEntity() => OrderEntity(
        id: id,
        title: title,
        total: total,
      );
}
