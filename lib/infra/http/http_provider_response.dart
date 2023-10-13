class HttpProviderResponse<T> {
  final int? statusCode;
  final T? data;
  final Map? headers;

  HttpProviderResponse({required this.statusCode, required this.data, this.headers});

  @override
  String toString() {
    return 'Status Code: $statusCode\nHeaders:$headers\nData: $data';
  }
}
