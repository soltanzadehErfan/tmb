import 'package:flutter/material.dart';
import 'package:tmb/src/logic/notification_service.dart';
import '../../components/offline_component.dart';
import '../../logic/connectivity_service.dart';
import '../../logic/tambord_launcher_service.dart';
import '../../utils/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      _notificationShow();
    }
  }

  void _launchUrlOnStart() async {
    try {
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

  Future<void> _notificationShow() async {
    try {
      await launchTambord();
      await NotificationService().showNotification(
        0,
        'Tambord Notification Title',
        'Tambord Notification Body',
        'payload',
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: _connectionStatus == 'offline'
            ? const OfflineComponent()
            : ElevatedButton(
                onPressed: () async {
                  _notificationShow();
                  _launchUrlOnStart();
                },
                child:
                    SvgPicture.asset(tambordSvg, semanticsLabel: 'Acme Logo'),
              ),
      ),
    );
  }
}
