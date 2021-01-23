import 'package:fedi/app/ui/dialog/alert/fedi_simple_alert_dialog.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:url_launcher/url_launcher.dart';

final _logger = Logger("url_helper.dart");

class UrlHelper {
  static Future handleUrlClick(BuildContext context, String url) async {
    var isCanLaunch = await canLaunch(url);
    _logger.finest(() => "handleUrlClick isCanLaunch $isCanLaunch $url");
    if (isCanLaunch) {
      var launched = await launch(url);
      _logger.finest(() => "handleUrlClick launched $launched $url");
    } else {
      await FediSimpleAlertDialog(
        context: context,
        title: S.of(context).link_error_dialog_title,
        contentText: S.of(context).link_error_dialog_content(url),
      ).show(context);
    }
  }

  static String extractUrl(String value) {
    // TODO: rework url regex
    String string = value.replaceAll(RegExp("</a>"), "");
    return string.replaceAll(RegExp("<a[^>]*>"), "");
  }
}
