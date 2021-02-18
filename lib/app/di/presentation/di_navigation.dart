import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';

import 'package:poc_flutter_clean_repository/app/di/i_di_feature.dart';
import 'package:poc_flutter_clean_repository/presentation/ui/pages/home/home_page.dart';
import 'package:poc_flutter_clean_repository/presentation/ui/pages/pages.dart';
import 'package:poc_flutter_clean_repository/presentation/ui/utils/navigator/i_navigation.dart';
import 'package:poc_flutter_clean_repository/presentation/ui/utils/navigator/navigation.dart';
import 'package:poc_flutter_clean_repository/presentation/ui/utils/utils.dart';

class DINavigation implements IDIFeature {
  @override
  Future<void> configureInjection() async {
    GetIt getIt = GetIt.instance;

    getIt.registerSingletonAsync<INavigation>(
      () async {
        return Navigation.init(
          pages: [
            NavigationPage<LoadInitialDataPage>(NavigationRoutes.root),
            NavigationPage<LoadInitialDataPage>(NavigationRoutes.loadInitialData),
            NavigationPage<HomePage>(NavigationRoutes.home),
            NavigationPage<StreamOrderListPage>(NavigationRoutes.orderListWithStream),
            NavigationPage<MobxOrderListPage>(NavigationRoutes.orderListWithMobx),
          ],
          navigatorKey: GlobalKey<NavigatorState>(),
        );
      },
    );
  }
}
