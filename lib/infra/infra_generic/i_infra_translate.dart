import 'package:weather_forecast/domain/i_entity_model.dart';
import 'package:weather_forecast/infra/infra_generic/i_infra_response.dart';

abstract interface class IInfraTranslate<E extends IEntityModel, R extends IInfraResponse> {
  E? toEntity(R response);
  List<E>? toEntityList(List<R> response);
}
