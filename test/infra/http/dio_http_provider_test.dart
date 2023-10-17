import 'package:flutter_test/flutter_test.dart';
import 'package:weather_forecast/infra/http/dio_http_provider.dart';
import 'package:weather_forecast/infra/exceptions/infra_exceptions.dart';
import 'package:weather_forecast/infra/http/http_provider_response.dart';

void main() {
  group('Dio Http Provider Test', () {
    late DioHttpProvider dioHttpProvider;
    setUp(() {
      dioHttpProvider = DioHttpProvider();
    });
    test('Method _handleResponse must return a valid HttpProviderResponse from dioResponse', () async {
      // Action
      HttpProviderResponse? result = await dioHttpProvider.get(url: "http://www.google.com");

      // Assert
      expect(result?.statusCode, 200);
    });

    test('Should throw InfraNotFoundException if REST error is 404', () async {
      // Assert
      expect(() async => dioHttpProvider.get(url: "https://private-3e1aa-weatherapimock.apiary-mock.com/404_error"), throwsA(isA<InfraNotFoundException>()));
    });

    test('Should throw InfraNotAuthorizedException if REST error is 401', () async {
      // Assert
      expect(() async => dioHttpProvider.get(url: "https://private-3e1aa-weatherapimock.apiary-mock.com/401_error"), throwsA(isA<InfraNotAuthorizedException>()));
    });

    test('Should throw InfraException if REST error is not 401 or 404', () async {
      // Assert
      expect(() async => dioHttpProvider.get(url: "https://private-3e1aa-weatherapimock.apiary-mock.com/500_error"), throwsA(isA<InfraException>()));
    });

    test('Should return HttpProviderResponse with correct values when the REST request is OK (200) without query parameters', () async {
      // Action
      HttpProviderResponse? result = await dioHttpProvider.get(url: "https://private-3e1aa-weatherapimock.apiary-mock.com/get_example_ok_without_query_params");

      // Assert
      expect(result!.statusCode, 200);
      expect(result.data, '{"result":"OK =D"}');
    });

    test('Should return HttpProviderResponse with correct values when the REST request is OK (200) with query parameters', () async {
      // Action
      HttpProviderResponse? result = await dioHttpProvider.get(url: "https://private-3e1aa-weatherapimock.apiary-mock.com/get_example_ok_with_query_params", queryParameters: {"param01": "any test value"});

      // Assert
      expect(result!.statusCode, 200);
      expect(result.data, '{"result":"OK =D"}');
    });
  });
}
