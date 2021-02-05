import 'package:meta/meta.dart';

import 'package:poc_flutter_clean_repository/domain/usecases/order/i_add_order.dart';
import 'package:poc_flutter_clean_repository/crosscutting/remote/order/i_add_order_remote.dart';

class AddOrder implements IAddOrder {
  IAddOrderRemote addOrderRemote;

  AddOrder({@required this.addOrderRemote});

  @override
  Future<void> add() {
    throw UnimplementedError();
  }
}
