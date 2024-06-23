import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://tambord.com/');

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(),
        home: const Material(
          child: Center(
            child: ElevatedButton(
              onPressed: _launchUrl,
              child: Icon(Icons.home_rounded),
            ),
          ),
        ),
      ),
    );

Future<void> _launchUrl() async {
  if (!await launchUrl(_url, mode: LaunchMode.inAppWebView)) {
    throw Exception('Could not launch $_url');
  }
}
