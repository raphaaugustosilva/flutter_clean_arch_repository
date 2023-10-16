import 'package:weather_forecast/infra/http/http_provider_response.dart';

abstract class IHttpProvider {
  Future<HttpProviderResponse?> get({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });
}
