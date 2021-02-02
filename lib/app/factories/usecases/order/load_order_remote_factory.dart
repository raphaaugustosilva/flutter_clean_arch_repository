import '../../factories.dart';
import 'package:poc_flutter_clean_repository/data/usecases/usecases.dart';
import 'package:poc_flutter_clean_repository/infra/usecases/order/load_order_remote.dart';

ILoadOrderRemote makeLoadOrderRemote() => LoadOrderRemote(httpClient: makeHttpClient(), url: makeApiUrl('orders'));
