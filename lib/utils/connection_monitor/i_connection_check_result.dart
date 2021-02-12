import 'i_connection_monitor.dart';

abstract class IConnectionCheckResult {
  EConnectonType connectionType;
  bool hasInternet;

  IConnectionCheckResult(this.connectionType, this.hasInternet);
}
