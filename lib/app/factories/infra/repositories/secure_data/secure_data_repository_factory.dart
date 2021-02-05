import 'package:poc_flutter_clean_repository/domain/repositories/i_secure_data_repository.dart';
import 'package:poc_flutter_clean_repository/infra/repositories/secure_data/secure_data_repository.dart';

ISecureDataRepository makeSecureDataRepository() => SecureDataRepository();
