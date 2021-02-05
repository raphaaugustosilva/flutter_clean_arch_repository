abstract class IAddSecureData {
  //TODO Aqui eu posso ter dois add ou eu tenho que quebrar em dois usecases?
  Future<void> addMap(Map<String, String> values);
  Future<void> addKeyValue(String key, String value);
}
