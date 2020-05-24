import 'package:fedi/app/account/details/account_details_page.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/url/url_helper.dart';
import 'package:flutter/widgets.dart';

Future handleStatusContentLinkClick(
    {@required IStatusBloc statusBloc,
    @required String link,
    @required BuildContext context}) async {
  var mentionedAccount = await statusBloc.loadAccountByMentionUrl(url: link);

  if (mentionedAccount != null) {
    goToAccountDetailsPage(context, mentionedAccount);
  } else {
    await UrlHelper.handleUrlClick(context, link);
  }
}
