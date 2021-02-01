import 'package:poc_flutter_clean_repository/domain/entities/order/order_entity.dart';

abstract class IOrderListPresenter {
  Stream<List<OrderEntity>> get ordersStream;
  Stream<bool> get isLoadingStream;

  Future<void> loadData();
  void dispose();
}
