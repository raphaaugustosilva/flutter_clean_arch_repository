import 'package:mobx/mobx.dart';
part 'mobx_base_store.g.dart';

class MobxBaseStore = MobxBaseStoreBase with _$MobxBaseStore;

abstract interface class MobxBaseStoreBase with Store {
  @observable
  bool isLoading = false;

  @observable
  String? isLoadingText;

  @observable
  bool hasError = false;

  @observable
  String? errorText;

  @action
  setIsLoading(bool value, {String? loadingTextValue}) => [isLoading = value, isLoadingText = (value ? loadingTextValue : null)];

  @action
  setHasError(bool value, {String? errorTextValue}) => [hasError = value, errorText = (value ? errorTextValue : null)];
}
