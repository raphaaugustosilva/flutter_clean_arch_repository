import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';

import 'package:get_it/get_it.dart';

import '../../../ui/utils/utils.dart';
import '../../../ui/theme/theme.dart';
import '../../../ui/utils/extension_methods/hex_color_extension.dart';

class AppSnackbar implements IAppSnackbar {
  final SnackbarType snackbarType;
  final String message;
  final String subtitle;
  final String colorHex;
  final Duration duration;
  final bool showIcon;
  final Widget icon;
  final bool closeOnIconClick;
  final bool blockBackgroundIteration;
  final Function onClick;

  @override
  Function show;

  AppSnackbar(this.snackbarType, this.message, {this.subtitle, this.colorHex, this.duration, this.showIcon = true, this.icon, this.closeOnIconClick = true, this.blockBackgroundIteration = true, this.onClick}) {
    final INavigation _navigation = GetIt.instance.get<INavigation>();
    BuildContext _context = _navigation.navigatorKey.currentContext;
    this.show = () => _show(_context);
  }
  void _show(BuildContext context) {
    Flushbar flushbar = _prepareSnackbar();
    flushbar.show(context);
  }

  Flushbar _prepareSnackbar() {
    final _snackbarType = this.snackbarType ?? SnackbarType.info;
    Color colorFromParam = HexColor.fromHex(colorHex);

    final Color _snackBarColor = colorFromParam ??
        (_snackbarType == SnackbarType.info
            ? AppTheme.primaryColor
            : _snackbarType == SnackbarType.error
                ? AppThemeColors.alert
                : Colors.green);

    Widget _icon;
    if (this.showIcon) {
      final Icon infoIcon = Icon(Icons.info_outline, color: AppThemeColors.white);
      final ImageIcon errorIcon = ImageIcon(AssetImage("lib/presentation/ui/assets/images/icons/x_white.png"), color: AppThemeColors.white, size: 16);
      final Icon correctIcon = Icon(Icons.check, color: AppThemeColors.white);

      _icon = this.icon ?? _snackbarType == SnackbarType.info
          ? infoIcon
          : _snackbarType == SnackbarType.error
              ? errorIcon
              : correctIcon;
    }

    final Duration _duracao = this.duration ?? Duration(seconds: 5);

    Flushbar _flushbar;

    _flushbar = Flushbar(
      messageText: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(child: Text(this.message ?? "", style: AppTextTheme.message(color: AppThemeColors.white))),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            child: _icon,
            onTap: this.closeOnIconClick ? () => _flushbar.dismiss() : null,
          ),
        ],
      ),
      duration: _duracao,
      backgroundColor: _snackBarColor,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      isDismissible: true,
      animationDuration: Duration(milliseconds: 250),
      reverseAnimationCurve: Curves.easeOutBack,
      //reverseAnimationCurve: Curves.fastLinearToSlowEaseIn,
      forwardAnimationCurve: Curves.easeIn,
      margin: EdgeInsets.all(14),
      padding: EdgeInsets.fromLTRB(20, 24, 24, 24),
      borderRadius: 10,
      blockBackgroundInteraction: this.blockBackgroundIteration,
      onTap: (flushbar) {
        if (this.onClick != null) onClick();
      },
    );

    return _flushbar;
  }
}
