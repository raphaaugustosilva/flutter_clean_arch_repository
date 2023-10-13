import 'package:weather_forecast/infra/http/http_provider_response.dart';

abstract class IHttpProvider {
  Future<HttpProviderResponse?> get({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<HttpProviderResponse?> post({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    dynamic body,
  });

  Future<HttpProviderResponse?> patch({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    dynamic body,
  });

  Future<HttpProviderResponse?> put({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    dynamic body,
  });

  Future<HttpProviderResponse?> download({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<HttpProviderResponse?> delete({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });
}
