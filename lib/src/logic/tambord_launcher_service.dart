import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://tambord.com/');

/// [launchTambord]:
/// This method is for launching the Tambord url on default web browser of users device inAppWebView
Future<void> launchTambord() async {
  if (!await launchUrl(_url, mode: LaunchMode.inAppWebView)) {
    throw Exception('Could not launch $_url');
  }
}
