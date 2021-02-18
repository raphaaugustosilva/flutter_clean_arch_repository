import 'package:get_it/get_it.dart';
import 'package:poc_flutter_clean_repository/presentation/presenters/home/home_presenter.dart';
import 'package:poc_flutter_clean_repository/presentation/presenters/order/mobx_order_list_presenter.dart';
import 'package:poc_flutter_clean_repository/presentation/ui/pages/home/home_page.dart';
import 'package:poc_flutter_clean_repository/presentation/ui/utils/utils.dart';

import './di_navigation.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/order/i_get_order.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/config/i_load_config.dart';
import 'package:poc_flutter_clean_repository/app/di/i_di_feature.dart';
import 'package:poc_flutter_clean_repository/presentation/presenters/order/stream_order_list_presenter.dart';
import 'package:poc_flutter_clean_repository/presentation/ui/utils/keyboard_manager.dart';
import 'package:poc_flutter_clean_repository/presentation/presenters/load_initial_data/load_initial_data_presenter.dart';
import 'package:poc_flutter_clean_repository/presentation/ui/pages/pages.dart';

class DIPresentation implements IDIFeature {
  @override
  Future<void> configureInjection() async {
    await DINavigation().configureInjection();

    GetIt getIt = GetIt.instance;

    getIt.registerLazySingleton<KeyboardManager>(() => KeyboardManager());

    getIt.registerFactory<LoadInitialDataPresenter>(() => LoadInitialDataPresenter(loadConfig: getIt.get<ILoadConfig>()));

    getIt.registerFactory<LoadInitialDataPage>(() => LoadInitialDataPage(getIt.get<LoadInitialDataPresenter>()));

    getIt.registerFactory<HomePresenter>(() => HomePresenter());

    getIt.registerFactory<HomePage>(() => HomePage(presenter: getIt.get<HomePresenter>()));

    getIt.registerFactory<StreamOrderListPresenter>(() => StreamOrderListPresenter(getOrder: getIt.get<IGetOrder>()));

    getIt.registerFactory<StreamOrderListPage>(() => StreamOrderListPage(presenter: getIt.get<StreamOrderListPresenter>()));

    getIt.registerFactory<MobxOrderListPresenter>(() => MobxOrderListPresenter(getOrder: getIt.get<IGetOrder>()));

    getIt.registerFactory<MobxOrderListPage>(() => MobxOrderListPage(presenter: getIt.get<MobxOrderListPresenter>()));
  }
}
