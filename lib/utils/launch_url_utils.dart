import 'package:url_launcher/url_launcher.dart';

class LaunchUrlUtil {
  static Future<void> launchUrlInBrowser(String url) async {
    // print(url);
    
    try {
      if (!await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      )) {
        throw Exception('Could not launch $url');
      }
    } catch (e) {
      throw Exception('Could not launch $url');
    }
  }
}
