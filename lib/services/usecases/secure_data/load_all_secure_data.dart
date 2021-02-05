import 'package:meta/meta.dart';

import 'package:poc_flutter_clean_repository/domain/repositories/i_secure_data_repository.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/secure_data/i_get_all_secure_data.dart';

class GetAllSecureData implements IGetAllSecureData {
  ISecureDataRepository secureDataRepository;
  GetAllSecureData({@required this.secureDataRepository});

  @override
  Future<Map<String, String>> getAll() async {
    return await secureDataRepository.getAll();
  }
}
