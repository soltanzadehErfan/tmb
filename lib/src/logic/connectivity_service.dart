import 'package:connectivity_plus/connectivity_plus.dart';

///[connectivityChecker]: checks for users device network connectivity status in 3 results containing mobile data, wifi and ethernet
void connectivityChecker() async {
  final List<ConnectivityResult> connectivityResult =
      await (Connectivity().checkConnectivity());

  if (connectivityResult.contains(ConnectivityResult.mobile)) {
    // Mobile network available.
    print('online');
  } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
    // Wi-fi is available.
    // Note for Android:
    // When both mobile and Wi-Fi are turned on system will return Wi-Fi only as active network type
    print('online');
  } else if (connectivityResult.contains(ConnectivityResult.ethernet)) {
    // Ethernet connection available.
    print('online');
  } else if (connectivityResult.contains(ConnectivityResult.none)) {
    print('offline');
    // No available network types
  }
}
