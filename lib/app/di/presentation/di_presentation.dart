import 'package:get_it/get_it.dart';
import 'package:poc_flutter_clean_repository/presentation/ui/utils/utils.dart';

import './di_navigation.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/order/i_load_order.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/config/i_load_config.dart';
import 'package:poc_flutter_clean_repository/app/di/i_di_feature.dart';
import 'package:poc_flutter_clean_repository/presentation/presenters/order/i_order_list_presenter.dart';
import 'package:poc_flutter_clean_repository/presentation/presenters/order/stream_order_list_presenter.dart';
import 'package:poc_flutter_clean_repository/presentation/ui/utils/keyboard_manager.dart';
import 'package:poc_flutter_clean_repository/presentation/presenters/load_initial_data/i_load_initial_data_presenter.dart';
import 'package:poc_flutter_clean_repository/presentation/presenters/load_initial_data/stream_load_initial_data_presenter.dart';
import 'package:poc_flutter_clean_repository/presentation/ui/pages/pages.dart';

class DIPresentation implements IDIFeature {
  @override
  Future<void> configureInjection() async {
    await DINavigation().configureInjection();

    GetIt getIt = GetIt.instance;

    getIt.registerLazySingleton<KeyboardManager>(() => KeyboardManager());

    getIt.registerFactory<ILoadInitialDataPresenter>(() {
      return StreamLoadInitialDataPresenter(
        loadConfig: getIt.get<ILoadConfig>(),
      );
    });

    getIt.registerFactory<LoadInitialDataPage>(() {
      ILoadInitialDataPresenter loadInitialDataPresenter = getIt.get<ILoadInitialDataPresenter>();
      return LoadInitialDataPage(loadInitialDataPresenter);
    });

    getIt.registerFactory<IOrderListPresenter>(() {
      return StreamOrderListPresenter(
        loadOrder: getIt.get<ILoadOrder>(),
      );
    });

    getIt.registerFactory<OrderListPage>(() {
      IOrderListPresenter orderListPresenter = getIt.get<IOrderListPresenter>();
      return OrderListPage(orderListPresenter);
    });
  }
}
