import 'package:meta/meta.dart';
import 'package:poc_flutter_clean_repository/domain/repositories/i_secure_data_repository.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/secure_data/i_add_secure_data.dart';

class AddSecureData implements IAddSecureData {
  ISecureDataRepository secureDataRepository;
  AddSecureData({@required this.secureDataRepository});

  @override
  Future<void> add(Map<String, String> mapConfigsKeyValue) async {
    await secureDataRepository.storeMap(mapConfigsKeyValue);
  }
}
