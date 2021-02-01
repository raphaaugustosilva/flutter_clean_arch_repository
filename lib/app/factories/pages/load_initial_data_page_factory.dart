import 'package:flutter/material.dart';

import 'package:poc_flutter_clean_repository/data/repositories/repositories.dart';
import 'package:poc_flutter_clean_repository/presentation/ui/pages/pages.dart';
import 'package:poc_flutter_clean_repository/presentation/presenters/interfaces.dart';
import 'package:poc_flutter_clean_repository/presentation/presenters/presenters.dart';
import 'package:poc_flutter_clean_repository/app/factories/repositories/secure_data_repository_factory.dart';
import 'package:poc_flutter_clean_repository/app/factories/repositories/remote_config_repository_factory.dart';

Widget makeLoadInitialDataPage() {
  ISecureDataRepository _secureDataRepository = makeSecureDataRepository();
  IRemoteConfigRepository _remoteConfigRepository = makeRemoteConfigRepository();

  ILoadInitialDataPresenter loadInitialDataPresenter = StreamLoadInitialDataPresenter(
    secureDataRepository: _secureDataRepository,
    remoteConfigRepository: _remoteConfigRepository,
  );

  return LoadInitialDataPage(loadInitialDataPresenter);
}
