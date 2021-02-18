import 'dart:async';
import 'package:meta/meta.dart';

import 'package:mobx/mobx.dart';

import 'package:poc_flutter_clean_repository/domain/usecases/order/i_get_order.dart';
import 'package:poc_flutter_clean_repository/domain/entities/order/order.dart';
import 'package:poc_flutter_clean_repository/presentation/presenters/mobx_base_store.dart';

part 'mobx_order_list_presenter.g.dart';

class MobxOrderListPresenter = _MobxOrderListPresenterBase with _$MobxOrderListPresenter;

abstract class _MobxOrderListPresenterBase extends MobxBaseStore with Store {
  final IGetOrder getOrder;
  _MobxOrderListPresenterBase({@required this.getOrder});

  ObservableList<Order> orders = ObservableList<Order>();

  @action
  setOrderList(value) => orders.addAll(value);

  // @computed
  // bool get orderGreaterThanFive => orders.length > 5;

  Future<void> loadData() async {
    try {
      setIsLoading(true);

      await Future.delayed(Duration(seconds: 2));
      final List<Order> orders = await getOrder.execute();

      setOrderList(orders);
    } finally {
      setIsLoading(false);
    }
  }
}
