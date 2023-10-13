class InfraException implements Exception {
  final Object? innerException;
  final int? statusCode;
  final String? message;
  InfraException({this.innerException, this.statusCode, this.message});
}

class InfraNotAuthorizedException extends InfraException {
  InfraNotAuthorizedException({super.innerException, super.statusCode, super.message});
}

class InfraNotFoundException extends InfraException {
  InfraNotFoundException({super.innerException, super.statusCode, super.message});
}
