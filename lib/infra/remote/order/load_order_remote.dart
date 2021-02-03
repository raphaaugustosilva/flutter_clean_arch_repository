import 'dart:convert';
import 'package:meta/meta.dart';

import 'package:http/http.dart' as http;
import 'package:poc_flutter_clean_repository/crosscutting/remote/order/i_load_order_remote.dart';
import 'package:poc_flutter_clean_repository/crosscutting/remote/order/order_response.dart';

import 'package:poc_flutter_clean_repository/domain/entities/entities.dart';



class LoadOrderRemote implements ILoadOrderRemote {
  final http.Client httpClient;
  final String url;
  LoadOrderRemote({@required this.url, @required this.httpClient});

  @override
  Future<List<OrderEntity>> load() async {
    try {
      http.Response httpResponse;
      try {
        httpResponse = await httpClient.get(url);
      } catch (e) {
        String mockResponseJson = "[\r\n      {\r\n        \"id\": \"1\",\r\n        \"title\": \"Pedido 1 REMOTO\",\r\n        \"total\": 120.0,\r\n        \"customerName\": \"Raphael\"\r\n      },\r\n      {\r\n        \"id\": \"2\",\r\n        \"title\": \"Pedido 2 REMOTO\",\r\n        \"total\": 220.0,\r\n        \"customerName\": \"Raphael\"\r\n      },\r\n      {\r\n        \"id\": \"3\",\r\n        \"title\": \"Pedido 3 REMOTO\",\r\n        \"total\": 330.0,\r\n        \"customerName\": \"Guilherme\"\r\n      }\r\n    ]";
        httpResponse = http.Response(mockResponseJson, 200);
      }

      List listResponseJson = httpResponse.body.isEmpty ? null : json.decode(httpResponse.body);
      return listResponseJson == null ? null : listResponseJson.map<OrderEntity>((responseJson) => OrderResponse.fromJson(responseJson).toEntity()).toList();
    } catch (e) {
      //Caso queiramos fazer algo aqui antes de dar o rethrow

      rethrow;
    }
  }
}
