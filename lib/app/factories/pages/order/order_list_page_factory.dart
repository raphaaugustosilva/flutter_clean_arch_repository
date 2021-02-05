import 'package:flutter/material.dart';

import '../../../services/usecases/order/load_order_factory.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/order/i_load_order.dart';
import 'package:poc_flutter_clean_repository/presentation/presenters/order/i_order_list_presenter.dart';
import 'package:poc_flutter_clean_repository/presentation/presenters/order/stream_order_list_presenter.dart';
import 'package:poc_flutter_clean_repository/presentation/ui/pages/order/order_list_page.dart';

Widget makeOrderListPage() {
  ILoadOrder loadOrder = makeLoadOrder();
  IOrderListPresenter orderListPresenter = StreamOrderListPresenter(loadOrder: loadOrder);
  return OrderListPage(orderListPresenter);
}
