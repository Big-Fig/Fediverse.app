import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/hashtag/hashtag_page.dart';
import 'package:fedi/app/instance/location/instance_location_bloc.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/ui/dialog/alert/fedi_simple_alert_dialog.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:url_launcher/url_launcher.dart';

final _logger = Logger("url_helper.dart");

class UrlHelper {
  static const _mastodonTagUrlParts = [
    "/tags/",
    "/tag/",
  ];

  static const _pleromaTagUrlParts = [
    "/tag/",
  ];

  static const _tagUrlParts = [
    ..._mastodonTagUrlParts,
    ..._pleromaTagUrlParts,
  ];

  static String? extractHashtagFromTagUrlIfExist(String url) {
    String? hashtag;

    url = url.toLowerCase();

    for (var tagUrlPart in _tagUrlParts) {
      tagUrlPart = tagUrlPart.toLowerCase();

      var indexOf = url.indexOf(tagUrlPart);

      if (indexOf > 0) {
        var startIndex = indexOf + tagUrlPart.length;
        hashtag = url.substring(startIndex);
        break;
      }
    }

    return hashtag;
  }

  static Future handleUrlClickWithInstanceLocation({
    required BuildContext context,
    required String url,
    required IInstanceLocationBloc instanceLocationBloc,
  }) async {
    var isLocal =
        instanceLocationBloc.instanceLocation == InstanceLocation.local;

    var uri = Uri.parse(url);

    var host = uri.host;
    // check relative links
    if (host.isNotEmpty != true) {
      if (isLocal) {
        url = _calculateLocalInstanceAbsoluteUrl(context, url);
      } else {
        url = _calculateRemoteInstanceAbsoluteUrl(instanceLocationBloc, url);
      }
    }

    var hashtag = extractHashtagFromTagUrlIfExist(url);

    if (hashtag != null) {
      var currentAuthInstanceBloc =
          ICurrentAuthInstanceBloc.of(context, listen: false);

      var localInstanceDomain =
          currentAuthInstanceBloc.currentInstance!.urlHost;

      if (isLocal) {
        // status or account note with hashtag fetched from local instance

        var uri = Uri.parse(url);

        var urlHost = uri.host;

        if (localInstanceDomain != urlHost) {
          return showRemoteInstanceHashtagActionsDialog(
            context: context,
            url: url,
            remoteInstanceDomain: urlHost,
            localInstanceDomain: localInstanceDomain,
            hashtag: hashtag,
          );
        } else {
          return goToHashtagPage(
            context: context,
            hashtag: Hashtag(
              name: hashtag,
              url: url,
              history: null,
            ),
          );
        }
      } else {
        // status or account note with hashtag fetched from remote instance

        String remoteInstanceDomain =
            instanceLocationBloc.remoteInstanceUriOrNull!.host;

        return showRemoteInstanceHashtagActionsDialog(
          context: context,
          url: url,
          remoteInstanceDomain: remoteInstanceDomain,
          localInstanceDomain: localInstanceDomain,
          hashtag: hashtag,
        );
      }
    }

    return handleUrlClick(
      context: context,
      url: url,
    );
  }

  static String _calculateRemoteInstanceAbsoluteUrl(
    IInstanceLocationBloc instanceLocationBloc,
    String url,
  ) {
    var remoteInstanceUriOrNull = instanceLocationBloc.remoteInstanceUriOrNull!;

    var urlHost = remoteInstanceUriOrNull.host;
    var urlSchema = remoteInstanceUriOrNull.scheme;

    url = "$urlSchema://$urlHost$url";
    return url;
  }

  static String _calculateLocalInstanceAbsoluteUrl(
    BuildContext context,
    String url,
  ) {
    var currentAuthInstanceBloc =
        ICurrentAuthInstanceBloc.of(context, listen: false);

    var urlHost = currentAuthInstanceBloc.currentInstance!.urlHost;
    var urlSchema = currentAuthInstanceBloc.currentInstance!.urlSchema;

    url = "$urlSchema://$urlHost$url";
    return url;
  }

  static Future handleUrlClickOnLocalInstanceLocation({
    required BuildContext context,
    required String url,
  }) async {
    var uri = Uri.parse(url);

    var host = uri.host;
    // check relative links
    if (host.isNotEmpty != true) {
      url = _calculateLocalInstanceAbsoluteUrl(context, url);
    }

    return handleUrlClick(
      context: context,
      url: url,
    );
  }

  static Future handleUrlClick({
    required BuildContext context,
    required String url,
  }) async {
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
