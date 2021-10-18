import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImp implements NetworkInfo {
  @override
  Future<bool> get isConnected async {
    final connectStatus = await Connectivity().checkConnectivity();
    if (connectStatus != ConnectivityResult.none) {
      try {
        final result = await InternetAddress.lookup('lavu.longtd2910.repl.co');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          return true;
        }
      } on SocketException catch (_) {
        return false;
      }
    }
    return false;
  }
}
