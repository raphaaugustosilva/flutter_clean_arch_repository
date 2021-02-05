import 'package:meta/meta.dart';

abstract class ILoadInitialDataPresenter {
  Future<void> loadData();
  Future<void> initAppConfig();
  void goToInitialPage({@required bool userAlreadyLoggedId});
  void dispose();
}
