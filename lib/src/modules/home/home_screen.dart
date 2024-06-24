import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../logic/url_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _launchUrlOnStart();
  }

  void _launchUrlOnStart() async {
    final urlProvider = Provider.of<UrlProvider>(context, listen: false);
    try {
      await urlProvider.launchTambord();
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
        child: ElevatedButton(
          onPressed: () async {
            final urlProvider =
                Provider.of<UrlProvider>(context, listen: false);
            try {
              await urlProvider.launchTambord();
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
