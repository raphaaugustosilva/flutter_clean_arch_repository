import '../../../../api_url_factory.dart';
import '../../../../http_client_factory.dart';
import 'package:poc_flutter_clean_repository/infra/crosscutting/microservice_xpto/order/interfaces/i_load_order_remote.dart';
import 'package:poc_flutter_clean_repository/infra/crosscutting/microservice_xpto/order/load_order_remote.dart';

ILoadOrderRemote makeLoadOrderRemote() => LoadOrderRemote(
      url: makeApiUrl("orders"),
      httpClient: makeHttpClient(),
    );
