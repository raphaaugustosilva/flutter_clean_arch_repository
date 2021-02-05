import 'package:meta/meta.dart';

import 'package:poc_flutter_clean_repository/domain/repositories/i_secure_data_repository.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/secure_data/i_delete_secure_data.dart';

class DeleteSecureData implements IDeleteSecureData {
  ISecureDataRepository secureDataRepository;
  DeleteSecureData({@required this.secureDataRepository});

  @override
  Future<void> delete(String key) async {
    return await secureDataRepository.delete(key);
  }

  @override
  Future<void> deleteAll() async {
    return await secureDataRepository.deleteAll();
  }
}
