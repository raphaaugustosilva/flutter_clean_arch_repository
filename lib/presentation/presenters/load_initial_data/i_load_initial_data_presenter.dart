import 'package:meta/meta.dart';

abstract class ILoadInitialDataPresenter {
  Future<void> loadInitialData();
  void goToInitialPage({@required bool userAlreadyLoggedId});
  void dispose();
}
