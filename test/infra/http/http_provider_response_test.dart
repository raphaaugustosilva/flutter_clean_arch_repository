import 'package:flutter_test/flutter_test.dart';
import 'package:weather_forecast/infra/http/http_provider_response.dart';

void main() {
  group('Http Provider Response Test', () {
    test('HttpProviderResponse toString must return structured message', () async {
      // Arrange
      HttpProviderResponse<String>? httpProviderResponse = HttpProviderResponse<String>(statusCode: 200, data: "mock data", headers: {"header_key": "header_value"});

      // Assert
      expect(httpProviderResponse.toString(), "Status Code: 200\nHeaders:{header_key: header_value}\nData: mock data");
    });
  });
}
