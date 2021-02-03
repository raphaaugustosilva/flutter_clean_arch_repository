import '../../factories.dart';
import 'package:poc_flutter_clean_repository/services/usecases/usecases.dart';
import 'package:poc_flutter_clean_repository/infra/remote/order/load_order_remote.dart';

ILoadOrderRemote makeLoadOrderRemote() => LoadOrderRemote(httpClient: makeHttpClient(), url: makeApiUrl('orders'));
