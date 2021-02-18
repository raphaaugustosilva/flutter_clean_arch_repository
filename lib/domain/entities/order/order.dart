import 'package:meta/meta.dart';

import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final String id;
  final String title;
  final double total;
  final bool isSynchronized;

  List get props => [id, title, total];

  Order({@required this.id, @required this.title, @required this.total, this.isSynchronized});

  factory Order.fromJson(Map json) {
    if (!json.keys.toSet().containsAll(['id', 'title', 'total', 'isSynchronized'])) {
      throw Exception("Dados inválidos");
    }
    return Order(
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
}
