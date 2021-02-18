import 'package:get_it/get_it.dart';

import 'package:poc_flutter_clean_repository/presentation/ui/utils/navigator/i_navigation.dart';
import 'package:poc_flutter_clean_repository/presentation/ui/utils/utils.dart';

class HomePresenter {
  final INavigation _navigation = GetIt.instance.get<INavigation>();

  Future<void> gotoOrderPageWithStream() {
    return _navigation.navigateTo(NavigationRoutes.orderListWithStream);
  }

  Future<void> gotoOrderPageWithMobx() {
    return _navigation.navigateTo(NavigationRoutes.orderListWithMobx);
  }
}
