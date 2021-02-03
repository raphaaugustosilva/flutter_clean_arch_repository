import 'package:flutter/material.dart';

import 'package:poc_flutter_clean_repository/services/repositories/repositories.dart';
import 'package:poc_flutter_clean_repository/presentation/presenters/order/i_order_list_presenter.dart';
import 'package:poc_flutter_clean_repository/presentation/presenters/order/stream_order_list_presenter.dart';
import 'package:poc_flutter_clean_repository/presentation/ui/pages/order/order_list_page.dart';
import 'package:poc_flutter_clean_repository/app/factories/repositories/order_repository_factory.dart';

Widget makeOrderListPage() {
  IOrderRepository orderRepository = makeOrderRepository();
  IOrderListPresenter orderListPresenter = StreamOrderListPresenter(orderRepository: orderRepository);
  return OrderListPage(orderListPresenter);
}
