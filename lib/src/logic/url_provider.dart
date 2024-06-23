import 'package:tmb/src/utils/safe_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlProvider extends SafeProvider {
  final Uri _url = Uri.parse('https://tambord.com/');

  Future<void> launchWebsite() async {
    if (!await launchUrl(_url, mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $_url');
    }
  }
}
