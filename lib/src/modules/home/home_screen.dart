import 'package:flutter/material.dart';
import '../../components/offline_component.dart';
import '../../logic/connectivity_service.dart';
import '../../logic/tambord_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _connectionStatus = 'unknown';

  @override
  void initState() {
    super.initState();
    _checkConnectivity();
  }

  Future<void> _checkConnectivity() async {
    final status = await connectivityChecker();
    setState(() {
      _connectionStatus = status;
    });

    if (status == 'online') {
      _launchUrlOnStart();
    }
  }

  void _launchUrlOnStart() async {
    // final urlProvider = Provider.of<UrlProvider>(context, listen: false);
    try {
      // await urlProvider.launchTambord();
      await launchTambord();
    } catch (e) {
      _showErrorSnackBar(e);
    }
  }

  void _showErrorSnackBar(dynamic error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to launch URL: ${error.toString()}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: _connectionStatus == 'offline'
            ? const OfflineComponent()
            : ElevatedButton(
                onPressed: () async {
                  // final urlProvider =
                  //     Provider.of<UrlProvider>(context, listen: false);
                  try {
                    // await urlProvider.launchTambord();
                    await launchTambord();
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(e.toString())),
                    );
                  }
                },
                child: const Icon(Icons.home_rounded),
              ),
      ),
    );
  }
}
