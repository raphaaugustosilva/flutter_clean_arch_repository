abstract class IRepository<T> {
  final String repositoryName;
  IRepository({required this.repositoryName});

  Future<T?> get(String id);
  Future<T?> getFirst();
  Future<List<T>?> getAll();
}
