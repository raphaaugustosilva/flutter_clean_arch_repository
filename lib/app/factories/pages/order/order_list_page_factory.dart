import 'package:flutter/material.dart';

import '../../../factories/infra/repositories/order/order_repository_factory.dart';
import 'package:poc_flutter_clean_repository/domain/repositories/i_order_repository.dart';
import 'package:poc_flutter_clean_repository/presentation/presenters/order/i_order_list_presenter.dart';
import 'package:poc_flutter_clean_repository/presentation/presenters/order/stream_order_list_presenter.dart';
import 'package:poc_flutter_clean_repository/presentation/ui/pages/order/order_list_page.dart';

Widget makeOrderListPage() {
  IOrderRepository orderRepository = makeOrderRepository();
  IOrderListPresenter orderListPresenter = StreamOrderListPresenter(orderRepository: orderRepository);
  return OrderListPage(orderListPresenter);
}
