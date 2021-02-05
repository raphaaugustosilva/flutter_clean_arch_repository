import 'package:flutter/material.dart';

import '../../services/usecases/config/load_config_factory.dart';
import 'package:poc_flutter_clean_repository/domain/usecases/config/i_load_config.dart';
import 'package:poc_flutter_clean_repository/presentation/ui/pages/pages.dart';
import 'package:poc_flutter_clean_repository/presentation/presenters/interfaces.dart';
import 'package:poc_flutter_clean_repository/presentation/presenters/presenters.dart';

Widget makeLoadInitialDataPage() {
  ILoadConfig _loadConfig = makeLoadConfig();

  ILoadInitialDataPresenter loadInitialDataPresenter = StreamLoadInitialDataPresenter(loadConfig: _loadConfig);
  return LoadInitialDataPage(loadInitialDataPresenter);
}
