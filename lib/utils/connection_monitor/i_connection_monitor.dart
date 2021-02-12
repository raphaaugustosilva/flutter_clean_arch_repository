enum EConnectonType { wifi, mobile, none }

abstract class IConnectionMonitor {
  bool get hasConnection;
  Stream get getStreamChangedConnection;
  Future init();
  Future<bool> checkInternetConnection(EConnectonType connectionType);
}

abstract class IConnectionCheckResult {
  EConnectonType connectionType;
  bool hasInternet;

  IConnectionCheckResult(this.connectionType, this.hasInternet);
}
