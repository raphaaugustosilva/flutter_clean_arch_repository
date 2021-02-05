abstract class IGetSecureData {
  //TODO Aqui eu posso ter dois get ou eu tenho que quebrar em dois usecases?
  Future<String> get(String key);
  Future<Map<String, String>> getAll();
}
