import '../../entities/entities.dart';

abstract class ILoadOrder {
  Future<List<OrderEntity>> load();
}
