import 'package:url_launcher/url_launcher.dart';

// /// [UrlProvider]:
// /// provides a method for launching the urls on default web browser of users device
// class UrlProvider extends SafeProvider {
//   final Uri _tambordUrl = Uri.parse('https://tambord.com/');
//
//   Future<void> launchTambord() async {
//     if (!await launchUrl(_tambordUrl, mode: LaunchMode.inAppWebView)) {
//       throw Exception('Could not launch $_tambordUrl');
//     }
//   }
// }

final Uri _url = Uri.parse('https://tambord.com/');

/// [launchTambord]:
/// This method is for launching the Tambord url on default web browser of users device inAppWebView
Future<void> launchTambord() async {
  if (!await launchUrl(_url, mode: LaunchMode.inAppWebView)) {
    throw Exception('Could not launch $_url');
  }
}
