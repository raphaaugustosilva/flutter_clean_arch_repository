import 'package:poc_flutter_clean_repository/domain/entities/entities.dart';

abstract class ILoadOrderLocal {
  Future<List<OrderEntity>> load();
}
