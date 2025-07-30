import 'package:url_launcher/url_launcher.dart';

class ContactHelper {
  /// Call a phone number
  static Future<void> makePhoneCall(String phoneNumber) async {
    final Uri uri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  /// Send an email
  static Future<void> sendEmail({
    required String toEmail,

  }) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: toEmail,
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch $toEmail';
    }
  }

  /// Helper to encode query parameters
  static String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
    '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}
