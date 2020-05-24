import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/dialog/alert/simple_alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlHelper {
  static Future handleUrlClick(BuildContext context, String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      var appLocalizations = AppLocalizations.of(context);
      await SimpleAlertDialog(
              context: context,
              title: appLocalizations.tr("link.error.dialog.title"),
              content: appLocalizations.tr("link.error.dialog.content",
                  args: [url]))
          .show(context);
    }
  }

  static String extractUrl(String value) {
    // TODO: rework url regex
    String string = value.replaceAll(RegExp("</a>"), "");
    return string.replaceAll(RegExp("<a[^>]*>"), "");
  }
}
