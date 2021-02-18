import 'dart:convert';
import 'package:meta/meta.dart';

import "package:http/http.dart" as http;

import 'package:poc_flutter_clean_repository/crosscutting/exceptions/xpto_api_exceptions.dart';
import 'package:poc_flutter_clean_repository/crosscutting/microservice_xpto/order/interfaces/i_xpto_order.dart';
import 'package:poc_flutter_clean_repository/crosscutting/microservice_xpto/order/models/get_xpto_order_response.dart';
import 'package:poc_flutter_clean_repository/crosscutting/microservice_xpto/order/models/post_xpto_order_request.dart';

class XptoOrder implements IXptoOrder {
  final http.Client httpClient;
  final String _url = "http://sua-api.elb.us-east-1.amazonaws.com/order";

  XptoOrder({@required this.httpClient});

  @override
  Future<List<GetXptoOrderResponse>> getOrders() async {
    http.Response response;
    try {
      response = await httpClient.get(_url);
    } catch (e) {
      String mockResponseJson = "[\r\n      {\r\n        \"id\": \"1\",\r\n        \"title\": \"Pedido 1 REMOTO\",\r\n        \"total\": 120.0,\r\n        \"customerName\": \"Raphael\"\r\n      },\r\n      {\r\n        \"id\": \"2\",\r\n        \"title\": \"Pedido 2 REMOTO\",\r\n        \"total\": 220.0,\r\n        \"customerName\": \"Raphael\"\r\n      },\r\n      {\r\n        \"id\": \"3\",\r\n        \"title\": \"Pedido 3 REMOTO\",\r\n        \"total\": 330.0,\r\n        \"customerName\": \"Guilherme\"\r\n      }\r\n    ]";
      response = http.Response(mockResponseJson, 200);
    }

    //TODO fazer usecase para exceptions (e colocar dentro de um componente nosso a ser criado de http)
    if (response.statusCode == 404) {
      throw XptoApiNotFoundException();
    }

    List listResponseJson = response.body.isEmpty ? null : json.decode(response.body);
    return listResponseJson == null ? null : listResponseJson.map<GetXptoOrderResponse>((responseJson) => GetXptoOrderResponse.fromJson(responseJson)).toList();
  }

  @override
  Future<GetXptoOrderResponse> postOrder(PostXptoOrderRequest request) async {
    Map<String, dynamic> bodyJson = request.toJson();
    var bodyEncoded = json.encode(bodyJson);

    http.Response response;
    try {
      response = await httpClient.post(_url, body: bodyEncoded);
    } catch (e) {
      String mockResponseJson = "{\r\n        \"id\": \"1\",\r\n        \"title\": \"Pedido 1 REMOTO\",\r\n        \"total\": 120.0,\r\n        \"customerName\": \"Raphael\"\r\n }";
      response = http.Response(mockResponseJson, 200);
    }

    //TODO fazer usecase para exceptions (e colocar dentro de um componente nosso a ser criado de http)
    if (response.statusCode == 404) {
      throw XptoApiNotFoundException();
    }

    Map<String, dynamic> responseJson = response.body.isEmpty ? null : json.decode(utf8.decode(response.bodyBytes));
    return GetXptoOrderResponse.fromJson(responseJson);
  }
}
