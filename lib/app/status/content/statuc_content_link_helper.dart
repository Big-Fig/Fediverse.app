import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/details/account_details_page.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/dialog/alert/simple_alert_dialog.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

Future handleStatusContentLinkClick(
    {@required IStatusBloc statusBloc,
    @required String link,
    @required BuildContext context}) async {
  var mentionedAccount = await statusBloc.loadAccountByMentionUrl(url: link);

  if (mentionedAccount != null) {
    goToAccountDetailsPage(context, mentionedAccount);
  } else {
    var isCanLaunchLink = await canLaunch(link);

    if (isCanLaunchLink) {
      await launch(link);
    } else {
      var appLocalizations = AppLocalizations.of(context);
      await SimpleAlertDialog(
        context: context,
        title: appLocalizations.tr("app.status.content.link.launch.error.dialog"
            ".title"),
        content: appLocalizations.tr(
            "app.status.content.link.launch.error.dialog"
            ".content",
            args: [link]),
      ).show(context);
    }
  }
}
