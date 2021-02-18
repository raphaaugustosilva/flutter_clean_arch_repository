import 'package:mobx/mobx.dart';
part 'mobx_base_store.g.dart';

class MobxBaseStore = _MobxBaseStoreBase with _$MobxBaseStore;

abstract class _MobxBaseStoreBase with Store {
  @observable
  bool isLoading = false;

  @action
  setIsLoading(value) => isLoading = value;
}
