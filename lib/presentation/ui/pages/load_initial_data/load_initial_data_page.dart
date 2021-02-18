import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:poc_flutter_clean_repository/presentation/ui/theme/theme.dart';
import 'package:poc_flutter_clean_repository/presentation/ui/components/components.dart';
import 'package:poc_flutter_clean_repository/presentation/presenters/load_initial_data/load_initial_data_presenter.dart';

class LoadInitialDataPage extends StatelessWidget {
  final LoadInitialDataPresenter presenter;
  LoadInitialDataPage(this.presenter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeColors.white,
      body: Builder(
        builder: (_) {
          presenter.loadData();

          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark,
            child: SafeArea(
              top: true,
              child: Padding(
                padding: AppTheme.defaultPaddingHorizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Center(
                        child: LoadingComponent(loadingText: "Carregando dados"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
