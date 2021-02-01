enum SnackbarType { info, error, correct }

abstract class IAppSnackbar {
  final SnackbarType snackbarType;
  final String message;
  final String subtitle;
  final String colorHex;
  final Duration duration;
  final bool showIcon;
  final dynamic icon;
  final bool closeOnIconClick;
  final bool blockBackgroundIteration;
  final Function onClick;

  IAppSnackbar(this.snackbarType, this.message, {this.subtitle, this.colorHex, this.duration, this.showIcon = true, this.icon, this.closeOnIconClick = true, this.blockBackgroundIteration = true, this.onClick});
  Function show;
}
