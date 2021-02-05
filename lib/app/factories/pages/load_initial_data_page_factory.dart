import 'package:flutter/material.dart';

import '../../services/usecases/config/load_config_factory.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/config/i_load_config.dart';
import 'package:poc_flutter_clean_repository/presentation/ui/pages/pages.dart';
import 'package:poc_flutter_clean_repository/presentation/presenters/interfaces.dart';
import 'package:poc_flutter_clean_repository/presentation/presenters/presenters.dart';

Widget makeLoadInitialDataPage() {
  ILoadConfig loadConfig = makeLoadConfig();

  ILoadInitialDataPresenter loadInitialDataPresenter = StreamLoadInitialDataPresenter(loadConfig: loadConfig);
  return LoadInitialDataPage(loadInitialDataPresenter);
}
