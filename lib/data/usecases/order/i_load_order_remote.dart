import 'package:poc_flutter_clean_repository/domain/entities/entities.dart';

abstract class ILoadOrderRemote {
  Future<List<OrderEntity>> load();
}
