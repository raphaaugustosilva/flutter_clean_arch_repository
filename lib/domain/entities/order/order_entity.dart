import 'package:meta/meta.dart';

class OrderEntity {
  final String id;
  final String title;
  final double total;

  OrderEntity({@required this.id, @required this.title, @required this.total});
}
