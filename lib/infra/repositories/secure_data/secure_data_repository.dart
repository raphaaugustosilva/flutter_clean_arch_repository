import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:poc_flutter_clean_repository/domain/repositories/i_secure_data_repository.dart';

//This implementation uses the flutter_secure_storage plugin, which stores/gets values from device`s secure area (Keystore for iOS and Keychain for Android)
class SecureDataRepository implements ISecureDataRepository {
  final secureStore = FlutterSecureStorage();

  @override
  Future<void> addMap(Map<String, String> values) async {
    for (String key in values.keys) {
      await secureStore.write(key: key, value: values[key]);
    }
  }

  @override
  Future<void> addKeyValue(String key, String value) async {
    await secureStore.write(key: key, value: value);
  }

  @override
  Future<String> get(String key) async {
    return await secureStore.read(key: key);
  }

  @override
  Future<Map<String, String>> getAll() async {
    return await secureStore.readAll();
  }

  @override
  Future<void> delete(String key) async {
    await secureStore.delete(key: key);
  }

  @override
  Future<void> deleteAll() async {
    await secureStore.deleteAll();
  }
}
