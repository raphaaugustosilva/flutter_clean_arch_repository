import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:poc_flutter_clean_repository/domain/repositories/i_secure_data_repository.dart';


//This implementation uses the flutter_secure_storage plugin, which stores/gets values from device`s secure area (Keystore for iOS and Keychain for Android)
class SecureDataRepository implements ISecureDataRepository {
  final secureStore = FlutterSecureStorage();

  @override
  Future<void> storeKeyValue(String key, String value) async {
    await secureStore.write(key: key, value: value);
  }

  @override
  Future<void> storeMap(Map<String, String> mapConfigsKeyValue) async {
    for (String key in mapConfigsKeyValue.keys) {
      await secureStore.write(key: key, value: mapConfigsKeyValue[key]);
    }
  }

  @override
  Future<String> getFromKey(String key) async {
    return await secureStore.read(key: key);
  }

  @override
  Future<Map<String, String>> getAll() async {
    return await secureStore.readAll();
  }

  @override
  Future<void> deleteFromKey(String key) async {
    await secureStore.delete(key: key);
  }

  @override
  Future<void> deleteAll() async {
    await secureStore.deleteAll();
  }
}
