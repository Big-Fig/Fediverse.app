import 'package:fedi/app/account/details/local_account_details_page.dart';
import 'package:fedi/app/account/details/remote_account_details_page.dart';
import 'package:fedi/app/hashtag/hashtag_page.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/url/url_helper.dart';
import 'package:flutter/widgets.dart';

Future handleStatusBodyLinkClick({
  @required IStatusBloc statusBloc,
  @required String link,
  @required BuildContext context,
}) async {
  var instanceLocation = statusBloc.instanceLocation;
  var isLocal = instanceLocation == InstanceLocation.local;

  var mentionedAccount = await statusBloc.loadAccountByMentionUrl(url: link);

  if (mentionedAccount != null) {
    if (isLocal) {
      goToLocalAccountDetailsPage(
        context,
        account: mentionedAccount,
      );
    } else {
      goToRemoteAccountDetailsPage(
        context,
        account: mentionedAccount,
      );
    }
  } else {
    var hashtag = await statusBloc.loadHashtagByUrl(url: link);
    if (hashtag != null && !isLocal) {
      goToHashtagPage(context: context, hashtag: hashtag);
    } else {
      await UrlHelper.handleUrlClick(context, link);
    }
  }
}
