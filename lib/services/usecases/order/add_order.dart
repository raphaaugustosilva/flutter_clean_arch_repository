import 'package:meta/meta.dart';
import 'package:poc_flutter_clean_repository/crosscutting/remote/order/i_load_order_remote.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/order/i_add_order.dart';


class AddOrder implements IAddOrder {
  ILoadOrderRemote loadOrderRemote;

  AddOrder({@required this.loadOrderRemote});

  @override
  Future<void> add() {
    //
  }
}
