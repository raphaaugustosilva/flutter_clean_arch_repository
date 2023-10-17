import 'package:mobx/mobx.dart';
import 'package:weather_forecast/domain/models/concert_model.dart';
import 'package:weather_forecast/presentation/presenters/mobx_base_store.dart';

part 'mobx_home.g.dart';

class MobxHome = MobxHomeBase with _$MobxHome;

abstract class MobxHomeBase extends MobxBaseStore with Store {
  @observable
  ObservableList<ConcertModel> concertList = ObservableList<ConcertModel>();

  @action
  setConcertList(List<ConcertModel>? list) {
    concertList.clear();
    if (list != null) concertList.addAll(list);
  }
}
