import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:weather_forecast/domain/infra/http/i_http_provider.dart';
import 'package:weather_forecast/infra/exceptions/infra_exceptions.dart';
import 'package:weather_forecast/infra/http/http_provider_response.dart';

class DioHttpProvider implements IHttpProvider {
  late Dio _dio;

  DioHttpProvider() {
    _dio = Dio();

    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
    ));
  }

  HttpProviderResponse _handleResponse(Response dioResponse) {
    final headersResponse = dioResponse.headers.map.map((key, value) => MapEntry(key, value.first.toString()));
    return HttpProviderResponse(statusCode: dioResponse.statusCode, data: (dioResponse.data is String) ? dioResponse.data : jsonEncode(dioResponse.data), headers: headersResponse);
  }

  @override
  Future<HttpProviderResponse?> get({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      late Response response;

      response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: headers != null ? Options(headers: headers) : null,
      );

      return _handleResponse(response);
    } on DioException catch (e) {
      _handleDioErrorException(e);
    }
    return null;
  }

  @override
  Future<HttpProviderResponse?> post({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    dynamic body,
  }) async {
    try {
      late Response response;

      response = await _dio.post(
        url,
        queryParameters: queryParameters,
        options: headers != null ? Options(headers: headers) : null,
        data: body,
      );

      return _handleResponse(response);
    } on DioException catch (e) {
      _handleDioErrorException(e);
    }
    return null;
  }

  @override
  Future<HttpProviderResponse?> patch({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    dynamic body,
  }) async {
    try {
      late Response response;

      response = await _dio.patch(
        url,
        queryParameters: queryParameters,
        options: headers != null ? Options(headers: headers) : null,
        data: body,
      );

      return _handleResponse(response);
    } on DioException catch (e) {
      _handleDioErrorException(e);
    }
    return null;
  }

  @override
  Future<HttpProviderResponse?> put({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    dynamic body,
  }) async {
    try {
      late Response response;

      response = await _dio.put(
        url,
        queryParameters: queryParameters,
        options: headers != null ? Options(headers: headers) : null,
        data: body,
      );

      return _handleResponse(response);
    } on DioException catch (e) {
      _handleDioErrorException(e);
    }
    return null;
  }

  @override
  Future<HttpProviderResponse?> download({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      late Response response;

      response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          responseType: ResponseType.bytes,
        ),
      );

      return _handleResponse(response);
    } on DioException catch (e) {
      _handleDioErrorException(e);
    }
    return null;
  }

  @override
  Future<HttpProviderResponse?> delete({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    dynamic body,
  }) async {
    try {
      late Response response;

      response = await _dio.delete(
        url,
        queryParameters: queryParameters,
        options: headers != null ? Options(headers: headers) : null,
        data: body,
      );

      return _handleResponse(response);
    } on DioException catch (e) {
      _handleDioErrorException(e);
    }
    return null;
  }

  void _handleDioErrorException(DioException dioException) {
    switch (dioException.response?.statusCode) {
      case 429:
      case 401:
        throw InfraNotAuthorizedException(innerException: dioException.error, statusCode: dioException.response?.statusCode, message: dioException.message);

      case 404:
        throw InfraNotFoundException(innerException: dioException.error, statusCode: dioException.response?.statusCode, message: dioException.message);

      default:
        throw InfraException(innerException: dioException.error, statusCode: dioException.response?.statusCode, message: dioException.message);
    }
  }
}
