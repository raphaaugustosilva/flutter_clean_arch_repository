abstract class ISecureDataRepository {
  Future<void> addMap(Map<String, String> values);
  Future<void> addKeyValue(String key, String value);
  Future<String> get(String key);
  Future<Map<String, String>> getAll();
  Future<void> delete(String key);
  Future<void> deleteAll();
}
