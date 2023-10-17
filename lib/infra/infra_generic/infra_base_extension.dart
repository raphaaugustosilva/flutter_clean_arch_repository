import 'package:weather_forecast/domain/i_entity_model.dart';
import 'package:weather_forecast/infra/infra_generic/i_infra_response.dart';
import 'package:weather_forecast/infra/infra_generic/i_infra_translate.dart';

extension InfraBaseExtension<R> on IInfraResponse {
  IEntityModel? toEntity<E>(IInfraTranslate t) => t.toEntity(this);
}

extension InfraBaseListExtension<R> on List<IInfraResponse> {
  List<IEntityModel>? toEntityList<E>(IInfraTranslate t) => t.toEntityList(this);
}
