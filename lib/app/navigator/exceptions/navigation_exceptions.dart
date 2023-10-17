class NavigationException implements Exception {
  dynamic innerException;
  final String? message;

  NavigationException({this.innerException, this.message});

  @override
  String toString() => "NavigationException :\nInnerException: ${innerException.toString()}\nError message: $message";
}
