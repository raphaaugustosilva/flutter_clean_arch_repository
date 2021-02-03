import 'dart:convert';

import 'package:poc_flutter_clean_repository/domain/entities/entities.dart';
import 'package:poc_flutter_clean_repository/domain/repositories/i_order_repository.dart';

class OrderRepository implements IOrderRepository {
  @override
  Future<List<OrderEntity>> load() async {
    try {
      //final data = await localStorage.fetch('orders');

      final data = "[{\"id\": \"1\",\"title\": \"Pedido 1 LOCAL\",\"total\": 20.0,\"isSynchronized\": \"true\"}]";

      if (data?.isEmpty == true) {
        throw Exception();
      }
      List localOrderList = json.decode(data);
      return _mapToEntity(localOrderList);
    } catch (error) {
      rethrow;
    }
  }

  List<OrderEntity> _mapToEntity(dynamic list) => list.map<OrderEntity>((json) => OrderEntity.fromJson(json)).toList();

  @override
  Future<void> add(OrderEntity order) {
    throw UnimplementedError();
  }
}
