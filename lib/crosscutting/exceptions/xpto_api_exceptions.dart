class XptoApiException implements Exception {
  // Exception innerException;
  // StackTrace stackTrace;
  // String errorMessage;
  // HypercubeApiException({this.innerException, this.stackTrace, this.errorMessage});

  // @override
  // String toString() => "HypercubeApiException:\nInnerException: $innerException\nMensagem Erro: $errorMessage";
}

class XptoApiNotFoundException extends XptoApiException {}

class XptoApiAccessDeniedException extends XptoApiException {}
