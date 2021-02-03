import 'package:meta/meta.dart';
import 'package:poc_flutter_clean_repository/crosscutting/remote/order/i_load_order_remote.dart';

import 'package:poc_flutter_clean_repository/domain/entities/order/order_entity.dart';
import 'package:poc_flutter_clean_repository/domain/repositories/i_order_repository.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/order/i_load_order.dart';

class LoadOrder implements ILoadOrder {
  IOrderRepository orderRepository;
  ILoadOrderRemote loadOrderRemote;

  LoadOrder({@required this.orderRepository, @required this.loadOrderRemote});

  @override
  Future<List<OrderEntity>> load() async {
    try {
      await orderRepository.add(null);
      return await loadOrderRemote.load();
    } catch (e) {
      return await orderRepository.load();
    }
  }
}
