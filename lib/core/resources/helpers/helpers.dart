import 'dart:html' as html;
import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

class Helpers {
  static void downloadCV() {
    String cvUrl = 'assets/cv/my_cv.pdf';
    html.AnchorElement(href: cvUrl)
      ..setAttribute('download', 'my_cv.pdf')
      ..click();
  }

  //function or opening whatsapp

  static Future<void> openUrl(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      log('could not lauch $url');
    }
  }
}
