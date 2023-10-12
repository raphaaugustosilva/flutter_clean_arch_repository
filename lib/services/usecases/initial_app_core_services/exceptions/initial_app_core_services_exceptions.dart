class InitialAppCoreServicesExceptions implements Exception {
  dynamic innerException;
  final String? message;

  InitialAppCoreServicesExceptions({this.innerException, this.message}) {
    if (innerException is Exception == false) {
      innerException = null;
    }
  }

  @override
  String toString() => "InitialAppCoreServicesExceptions :\nInnerException: $innerException\nError message: $message";
}
