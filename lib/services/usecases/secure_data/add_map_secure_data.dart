import 'package:meta/meta.dart';

import 'package:poc_flutter_clean_repository/domain/repositories/i_secure_data_repository.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/secure_data/i_add_map_secure_data.dart';

class AddMapSecureData implements IAddMapSecureData {
  ISecureDataRepository secureDataRepository;
  AddMapSecureData({@required this.secureDataRepository});

  @override
  Future<void> addMap(Map<String, String> values) async {
    return await secureDataRepository.addMap(values);
  }
}
