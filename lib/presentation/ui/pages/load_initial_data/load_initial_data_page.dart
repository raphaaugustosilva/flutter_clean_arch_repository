import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/theme.dart';
import '../../components/components.dart';
import '../../../presenters/interfaces.dart';

class LoadInitialDataPage extends StatefulWidget {
  final ILoadInitialDataPresenter presenter;
  LoadInitialDataPage(this.presenter);

  @override
  _LoadInitialDataState createState() => _LoadInitialDataState();
}

class _LoadInitialDataState extends State<LoadInitialDataPage> {
  @override
  void dispose() {
    super.dispose();
    widget.presenter.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.presenter.loadData();

    return Scaffold(
      backgroundColor: AppThemeColors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
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
      ),
    );
  }
}
