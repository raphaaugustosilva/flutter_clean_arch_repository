class RemoteConfigException implements Exception {
  dynamic innerException;
  final String? message;

  RemoteConfigException({this.innerException, this.message});

  @override
  String toString() => "RemoteConfigException :\nInnerException: ${innerException.toString()}\nError message: $message";
}
