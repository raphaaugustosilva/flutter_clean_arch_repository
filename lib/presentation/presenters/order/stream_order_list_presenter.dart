import 'dart:async';
import 'package:meta/meta.dart';

import 'package:poc_flutter_clean_repository/domain/usecases/order/i_get_order.dart';
import 'package:poc_flutter_clean_repository/domain/entities/order/order.dart';

class OrderListState {
  List<Order> orders;
  bool isLoading = false;
}

class StreamOrderListPresenter {
  //final INavigation _navigation = GetIt.instance.get<INavigation>();
  final IGetOrder getOrder;

  var _controller = StreamController<OrderListState>.broadcast();
  var _state = OrderListState();

  Stream<List<Order>> get ordersStream => _controller?.stream?.map((state) => state.orders)?.distinct();
  Stream<bool> get isLoadingStream => _controller?.stream?.map((state) => state.isLoading)?.distinct();

  StreamOrderListPresenter({@required this.getOrder});

  void _update() => _controller?.add(_state);

  void dispose() {
    _controller?.close();
    _controller = null;
  }

  Future<void> loadData() async {
    try {
      _state.isLoading = true;
      _update();

      await Future.delayed(Duration(seconds: 2));
      final List<Order> orders = await getOrder.execute();

      _state.orders = orders;
      _update();
    } finally {
      _state.isLoading = false;
      _update();
    }
  }
}
