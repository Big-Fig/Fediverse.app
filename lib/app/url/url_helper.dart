import 'package:fedi/generated/l10n.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/ui/dialog/alert/fedi_simple_alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlHelper {
  static Future handleUrlClick(BuildContext context, String url) async {
    var currentAuthInstanceBloc =
        ICurrentAuthInstanceBloc.of(context, listen: false);

    var uri = Uri.parse(url);

    var host = uri.host;
    if (host?.isNotEmpty != true) {
      var urlHost = currentAuthInstanceBloc.currentInstance.urlHost;
      var urlSchema = currentAuthInstanceBloc.currentInstance.urlSchema;

      url = "${urlSchema}://$urlHost$url";
    }

    if (await canLaunch(url)) {
      await launch(url);
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
