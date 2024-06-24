import 'package:connectivity_plus/connectivity_plus.dart';

/// [connectivityChecker]: checks for user's device network connectivity status
Future<String> connectivityChecker() async {
  final List<ConnectivityResult> connectivityResult = await Connectivity().checkConnectivity();

  if (connectivityResult.contains(ConnectivityResult.mobile) ||
      connectivityResult.contains(ConnectivityResult.wifi) ||
      connectivityResult.contains(ConnectivityResult.ethernet)) {
    return 'online';
  } else {
    return 'offline';
  }
}
