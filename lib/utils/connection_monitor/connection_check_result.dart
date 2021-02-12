import 'package:connectivity/connectivity.dart';

import 'i_connection_monitor.dart';

class ConnectionCheckResult implements IConnectionCheckResult {
  EConnectonType connectionType;
  bool hasInternet;

  ConnectionCheckResult(this.connectionType, this.hasInternet);
}

extension ExtensionConnectivityResult on ConnectivityResult {
  EConnectonType toConnectionType() {
    switch (this) {
      case ConnectivityResult.mobile:
        return EConnectonType.mobile;
        break;

      case ConnectivityResult.none:
        return EConnectonType.none;
        break;

      case ConnectivityResult.wifi:
        return EConnectonType.wifi;
        break;

      default:
        return null;
    }
  }
}
