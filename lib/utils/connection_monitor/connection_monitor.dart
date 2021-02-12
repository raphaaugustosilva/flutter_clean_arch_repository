import 'dart:io';
import 'dart:async';

import 'package:connectivity/connectivity.dart';

import 'i_connection_monitor.dart';
import 'connection_check_result.dart';

class ConnectionMonitor implements IConnectionMonitor {
  bool _hasConnection;
  bool get hasConnection => _hasConnection; //Variável que controla o status de conexão atual

  //Stream que é disparado quando a conexão muda
  StreamController changedConnectionStreamController = new StreamController.broadcast();
  Stream get getStreamChangedConnection => changedConnectionStreamController.stream;

  Future init() async {
    Connectivity connectivity = Connectivity();
    connectivity.onConnectivityChanged.listen((connectivityResult) async {
      await checkInternetConnection(connectivityResult?.toConnectionType());
    });

    await checkInternetConnection(null);
  }

  //Checa se possui conexão com a internet
  @override
  Future<bool> checkInternetConnection(EConnectonType connectionType) async {
    bool hasPriorConnection = hasConnection;

    try {
      final makeInternetRequisition = await InternetAddress.lookup('google.com');
      if (makeInternetRequisition.isNotEmpty && makeInternetRequisition[0].rawAddress.isNotEmpty) {
        _hasConnection = true;
      } else {
        _hasConnection = false;
      }
    } on SocketException catch (_) {
      _hasConnection = false;
    }

    //Manda uma atualização para todos os listeners apenas se houver alteração na conexão com a internet
    if (hasPriorConnection != hasConnection) {
      if (connectionType == null) {
        ConnectivityResult connectivityResult = await Connectivity().checkConnectivity();
        connectionType = connectivityResult?.toConnectionType();
      }

      ConnectionCheckResult conectividadeResultado = ConnectionCheckResult(connectionType, hasConnection);
      changedConnectionStreamController.add(conectividadeResultado);
    }

    return hasConnection;
  }
}
