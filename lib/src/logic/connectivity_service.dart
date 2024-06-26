import 'package:connectivity_plus/connectivity_plus.dart';

/// [connectivityChecker]: Checks for user's device network connectivity status and VPN usage
Future<String> connectivityChecker() async {
  final List<ConnectivityResult> connectivityResult =
      await Connectivity().checkConnectivity();

  if (connectivityResult.contains(ConnectivityResult.mobile) ||
      connectivityResult.contains(ConnectivityResult.wifi) ||
      connectivityResult.contains(ConnectivityResult.ethernet)) {
    return 'online';
  } else if (connectivityResult.contains(ConnectivityResult.vpn)) {
    return 'vpn';
  } else {
    return 'offline';
  }
}
