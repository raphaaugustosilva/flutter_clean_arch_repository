abstract class IRemoteConfigRemote {
  Future<void> init(bool syncSecretsOnInit);
  Future<void> fetchSecrets();
  Future<Map<String, String>> getAllSecrets();
  Future<String> getSecretFromKey(String key);
}
