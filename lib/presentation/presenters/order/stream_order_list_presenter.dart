import 'dart:async';
import 'package:meta/meta.dart';

import 'package:poc_flutter_clean_repository/domain/usecases/order/i_load_order.dart';
import 'package:poc_flutter_clean_repository/domain/entities/order/order_entity.dart';
import 'package:poc_flutter_clean_repository/presentation/presenters/order/i_order_list_presenter.dart';

class OrderListState {
  List<OrderEntity> orders;
  bool isLoading = false;
}

class StreamOrderListPresenter implements IOrderListPresenter {
  //final INavigation _navigation = GetIt.instance.get<INavigation>();
  final ILoadOrder loadOrder;

  var _controller = StreamController<OrderListState>.broadcast();
  var _state = OrderListState();

  Stream<List<OrderEntity>> get ordersStream => _controller?.stream?.map((state) => state.orders)?.distinct();
  Stream<bool> get isLoadingStream => _controller?.stream?.map((state) => state.isLoading)?.distinct();

  StreamOrderListPresenter({@required this.loadOrder});

  void _update() => _controller?.add(_state);

  void dispose() {
    _controller?.close();
    _controller = null;
  }

  @override
  Future<void> loadData() async {
    try {
      _state.isLoading = true;
      _update();

      await Future.delayed(Duration(seconds: 2));
      final List<OrderEntity> orders = await loadOrder.load();

      _state.orders = orders;
      _update();
    } finally {
      _state.isLoading = false;
      _update();
    }
  }
}
