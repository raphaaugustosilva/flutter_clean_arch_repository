import 'package:meta/meta.dart';

import 'package:poc_flutter_clean_repository/domain/entities/entities.dart';
import 'package:poc_flutter_clean_repository/data/usecases/usecases.dart';
import 'package:poc_flutter_clean_repository/data/repositories/repositories.dart';

class OrderRepository implements IOrderRepository {
  final ILoadOrderRemote loadOrderRemote;
  final ILoadOrderLocal loadOrderLocal;

  OrderRepository({@required this.loadOrderRemote, @required this.loadOrderLocal});

  @override
  Future<List<OrderEntity>> load() async {
    try {
      final remoteOrders = await loadOrderRemote.load();
      //await local.save(surveys);
      return remoteOrders;
    } catch (error) {
      return await loadOrderLocal.load();
    }
  }

  @override
  Future<void> add(OrderEntity order) {
    throw UnimplementedError();
  }
}
