import 'package:meta/meta.dart';

import 'package:poc_flutter_clean_repository/domain/repositories/i_secure_data_repository.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/secure_data/i_delete_all_secure_data.dart';

class DeleteAllSecureData implements IDeleteAllSecureData {
  ISecureDataRepository secureDataRepository;
  DeleteAllSecureData({@required this.secureDataRepository});

  @override
  Future<void> deleteAll() async {
    return await secureDataRepository.deleteAll();
  }
}
