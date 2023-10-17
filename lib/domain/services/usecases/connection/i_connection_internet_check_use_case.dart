abstract interface class IConnectionInternetCheckUseCase {
  Future<bool> execute({String? url});
}
