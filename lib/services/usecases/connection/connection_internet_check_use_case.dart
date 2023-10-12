import 'dart:io';
import 'package:weather_forecast/domain/services/usecases/connection/i_connection_internet_check_use_case.dart';

class ConnectionInternetCheckUseCase implements IConnectionInternetCheckUseCase {
  @override
  Future<bool> execute() async {
    bool? hasConnection;
    try {
      Duration timeoutLimit = const Duration(seconds: 3);
      final List<InternetAddress> makeInternetRequisition = await InternetAddress.lookup('google.com').timeout(timeoutLimit);

      if (makeInternetRequisition.isNotEmpty && makeInternetRequisition[0].rawAddress.isNotEmpty) {
        hasConnection = true;
      } else {
        hasConnection = false;
      }
    } on SocketException catch (_) {
      hasConnection = false;
    } catch (e) {
      hasConnection = false;
    }

    return hasConnection;
  }
}
