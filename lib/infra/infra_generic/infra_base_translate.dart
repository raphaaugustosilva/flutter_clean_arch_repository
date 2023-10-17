import 'package:weather_forecast/domain/i_entity_model.dart';
import 'package:weather_forecast/infra/infra_generic/i_infra_response.dart';
import 'package:weather_forecast/infra/infra_generic/i_infra_translate.dart';

abstract class InfraBaseTranslate<E extends IEntityModel, R extends IInfraResponse> implements IInfraTranslate<E, R> {
  @override
  E? toEntity(R response) {
    return null;
  }

  @override
  List<E>? toEntityList(List<R> response) {
    if (response.isEmpty) return null;
    return response.map((e) => toEntity(e)!).toList();
  }
}
