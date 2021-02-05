//TODO devo deixar aqui? ou na camada app?
class RemoteConfigExpiredException implements Exception {
  Exception innerException;
  StackTrace stackTrace;
  String errorMessage;
  RemoteConfigExpiredException({this.innerException, this.stackTrace, this.errorMessage});

  @override
  String toString() => "RemoteConfigExpiredException:\nInnerException: $innerException\nMensagem Erro: $errorMessage";
}
