import 'package:meta/meta.dart';

import 'package:poc_flutter_clean_repository/domain/repositories/i_secure_data_repository.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/secure_data/i_get_secure_data.dart';

class GetSecureData implements IGetSecureData {
  ISecureDataRepository secureDataRepository;
  GetSecureData({@required this.secureDataRepository});

  @override
  Future<String> get(String key) async {
    return await secureDataRepository.get(key);
  }
}
