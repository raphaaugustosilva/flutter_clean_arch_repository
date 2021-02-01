abstract class ISecureDataRepository {
  Future<void> storeKeyValue(String key, String value);
  Future<void> storeMap(Map<String, String> mapConfigsKeyValue);
  Future<String> getFromKey(String key);
  Future<Map<String, String>> getAll();
  Future<void> deleteFromKey(String key);
  Future<void> deleteAll();
}
