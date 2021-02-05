abstract class IDeleteSecureData {
  //TODO Aqui eu posso ter dois delete ou eu tenho que quebrar em dois usecases?
  Future<void> delete(String key);
  Future<void> deleteAll();
}
