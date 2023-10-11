abstract interface class IRemoteConfig {
  Future<void> init(bool syncSecretsOnInit);
  Future<bool> fetchSecrets();
  Future<Map<String, String>> getAllSecrets();
  Future<String> getSecretFromKey(String key);
}
