import 'package:connectivity_plus/connectivity_plus.dart';

/// [connectivityChecker]: Checks for user's device network connectivity status
/// Returns 'online' if the device is connected to a mobile, Wi-Fi, or ethernet network
/// Returns 'offline' otherwise
Future<String> connectivityChecker() async {
  // Check the connectivity status of the device
  final List<ConnectivityResult> connectivityResult =
      await Connectivity().checkConnectivity();

  // Determine the connection status based on the connectivity result
  if (connectivityResult.contains(ConnectivityResult.mobile) ||
      connectivityResult.contains(ConnectivityResult.wifi) ||
      connectivityResult.contains(ConnectivityResult.ethernet)) {
    return 'online';
  } else {
    return 'offline';
  }
}
