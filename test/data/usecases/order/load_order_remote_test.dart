import 'dart:convert';

import 'package:poc_flutter_clean_repository/crosscutting/microservice_xpto/order/interfaces/i_xpto_order.dart';
import 'package:poc_flutter_clean_repository/crosscutting/microservice_xpto/order/services/xpto_order.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../../../mocks/mocks.dart';
import 'package:poc_flutter_clean_repository/domain/entities/order/order.dart';

class HttpClientSpy extends Mock implements http.Client {}

void main() {
  IXptoOrder sut;
  HttpClientSpy httpClient;
  List<Map> list;

  PostExpectation mockRequest() => when(httpClient.get(any));

  void mockHttpData(List<Map> data) {
    list = data;
    mockRequest().thenAnswer((_) async => http.Response(json.encode(data), 200));
  }

  setUp(() {
    //url = faker.internet.httpUrl();
    httpClient = HttpClientSpy();
    sut = XptoOrder(httpClient: httpClient);
    mockHttpData(FakeOrdersFactory.makeApiJson());
  });

  test('Deve retornar lista de ordens ao realizar uma requisição válida (200)', () async {
    final orders = await sut.getOrders();

    expect(orders, [
      Order(
        id: list[0]['id'],
        title: list[0]['title'],
        total: list[0]['total'],
      ),
      Order(
        id: list[1]['id'],
        title: list[1]['title'],
        total: list[1]['total'],
      ),
      Order(
        id: list[2]['id'],
        title: list[2]['title'],
        total: list[2]['total'],
      )
    ]);
  });
}
