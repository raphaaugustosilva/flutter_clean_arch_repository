abstract class IRemoteConfigRepository {
  Future<void> init(bool syncSecretsOnInit);
  Future<void> fetchSecrets();
  Future<Map<String, String>> getAllSecrets();
  Future<String> getSecretFromKey(String key);
}
