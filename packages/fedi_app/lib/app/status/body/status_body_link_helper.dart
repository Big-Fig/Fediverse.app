import 'package:fedi_app/app/account/details/local_account_details_page.dart';
import 'package:fedi_app/app/account/details/remote_account_details_page.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:fedi_app/app/status/status_bloc.dart';
import 'package:fedi_app/app/url/url_helper.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

final _logger = Logger('status_body_link_helper.dart');

Future<void> handleStatusBodyLinkClick({
  required IStatusBloc statusBloc,
  required String url,
  required BuildContext context,
}) async {
  var instanceLocation = statusBloc.instanceLocation;
  var isLocal = instanceLocation == InstanceLocation.local;

  var mentionedAccount = await statusBloc.loadAccountByMentionUrl(url: url);

  _logger.finest(
    () => 'handleStatusBodyLinkClick '
        'isLocal $isLocal '
        'mentionedAccount $mentionedAccount',
  );

  if (mentionedAccount != null) {
    if (isLocal) {
      goToLocalAccountDetailsPage(
        context,
        account: mentionedAccount,
      );
    } else {
      await goToRemoteAccountDetailsPageBasedOnRemoteInstanceAccount(
        context,
        remoteInstanceAccount: mentionedAccount,
      );
    }
  } else {
    await UrlHelper.handleUrlClickWithInstanceLocation(
      context: context,
      url: url,
      instanceLocationBloc: statusBloc,
    );
  }
}
