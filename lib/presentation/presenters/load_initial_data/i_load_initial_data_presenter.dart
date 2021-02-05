import 'package:meta/meta.dart';

abstract class ILoadInitialDataPresenter {
  Future<void> loadData();
  void goToInitialPage({@required bool userAlreadyLoggedId});
  void dispose();
}
