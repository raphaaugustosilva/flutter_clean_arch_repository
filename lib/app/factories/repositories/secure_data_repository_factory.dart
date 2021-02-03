import 'package:poc_flutter_clean_repository/services/repositories/repositories.dart';
import 'package:poc_flutter_clean_repository/infra/repository/secure_data/secure_data_repository.dart';

ISecureDataRepository makeSecureDataRepository() => SecureDataRepository();
