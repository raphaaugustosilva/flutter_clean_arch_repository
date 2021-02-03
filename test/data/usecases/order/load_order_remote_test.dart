import 'dart:convert';

import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:poc_flutter_clean_repository/crosscutting/remote/order/i_load_order_remote.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;

import '../../../mocks/mocks.dart';
import 'package:poc_flutter_clean_repository/domain/entities/entities.dart';
import 'package:poc_flutter_clean_repository/infra/remote/order/load_order_remote.dart';

class HttpClientSpy extends Mock implements http.Client {}

void main() {
  ILoadOrderRemote sut;
  HttpClientSpy httpClient;
  String url;
  List<Map> list;

  PostExpectation mockRequest() => when(httpClient.get(any));

  void mockHttpData(List<Map> data) {
    list = data;
    mockRequest().thenAnswer((_) async => http.Response(json.encode(data), 200));
  }

  setUp(() {
    url = faker.internet.httpUrl();
    httpClient = HttpClientSpy();
    sut = LoadOrderRemote(httpClient: httpClient, url: url);
    mockHttpData(FakeOrdersFactory.makeApiJson());
  });

  test('Deve retornar lista de ordens ao realizar uma requisição válida (200)', () async {
    final orders = await sut.load();

    expect(orders, [
      OrderEntity(
        id: list[0]['id'],
        title: list[0]['title'],
        total: list[0]['total'],
      ),
      OrderEntity(
        id: list[1]['id'],
        title: list[1]['title'],
        total: list[1]['total'],
      ),
      OrderEntity(
        id: list[2]['id'],
        title: list[2]['title'],
        total: list[2]['total'],
      )
    ]);
  });
}
