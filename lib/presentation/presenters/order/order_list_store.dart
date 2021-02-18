// import 'dart:async';
// import 'package:mobx/mobx.dart';
// import 'package:poc_flutter_clean_repository/domain/usecases/order/i_load_order.dart';
// import 'package:poc_flutter_clean_repository/domain/entities/order/order_entity.dart';
// import 'package:poc_flutter_clean_repository/presentation/presenters/base_store.dart';
// import '../../../app/di/di.dart';

// part 'order_list_store.g.dart';

// class OrderListStore = _OrderListStoreBase with _$OrderListStore;

// abstract class _OrderListStoreBase extends BaseStore with Store {
//   final ILoadOrder loadOrder = getIt<ILoadOrder>();

//   ObservableList<OrderEntity> orders = ObservableList<OrderEntity>();

//   @action
//   addOrders(value) => orders.addAll(value);

//   @computed
//   bool get orderGreaterThanFive => orders.length > 5;

//   Future<void> loadData() async {
//     try {
//       setLoading(true);

//       await Future.delayed(Duration(seconds: 3));
//       final List<OrderEntity> orders = await loadOrder.load();
//       addOrders(orders);
//     } finally {
//       setLoading(false);
//     }
//   }
// }
