import 'package:meta/meta.dart';

import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  final String id;
  final String title;
  final double total;

  List get props => [id, title, total];

  OrderEntity({@required this.id, @required this.title, @required this.total});
}
