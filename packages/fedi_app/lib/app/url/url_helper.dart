import 'package:fedi_app/app/access/current/current_access_bloc.dart';
import 'package:fedi_app/app/hashtag/hashtag_model.dart';
import 'package:fedi_app/app/hashtag/page/hashtag_page_chooser_dialog.dart';
import 'package:fedi_app/app/hashtag/page/local/local_hashtag_page.dart';
import 'package:fedi_app/app/instance/location/instance_location_bloc.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:fedi_app/app/ui/dialog/alert/fedi_simple_alert_dialog.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:url_launcher/url_launcher.dart';

final _logger = Logger('url_helper.dart');

class UrlHelper {
  static const _mastodonTagUrlParts = [
    '/tags/',
    '/tag/',
  ];

  static const _unifediTagUrlParts = [
    '/tag/',
  ];

  static const _tagUrlParts = [
    ..._mastodonTagUrlParts,
    ..._unifediTagUrlParts,
  ];

  static String? extractHashtagFromTagUrlIfExist(String url) {
    String? hashtag;

    var actualUrl = url.toLowerCase();

    for (var tagUrlPart in _tagUrlParts) {
      tagUrlPart = tagUrlPart.toLowerCase();

      var indexOf = actualUrl.indexOf(tagUrlPart);

      if (indexOf > 0) {
        var startIndex = indexOf + tagUrlPart.length;
        hashtag = actualUrl.substring(startIndex);
        break;
      }
    }

    return hashtag;
  }

  static Future<void> handleUrlClickWithInstanceLocation({
    required BuildContext context,
    required String url,
    required IInstanceLocationBloc instanceLocationBloc,
  }) async {
    var isLocal =
        instanceLocationBloc.instanceLocation == InstanceLocation.local;

    var uri = Uri.parse(url);

    var host = uri.host;

    var actualUrl = url;

    // check relative links
    if (!host.isNotEmpty) {
      if (isLocal) {
        actualUrl = _calculateLocalInstanceAbsoluteUrl(context, actualUrl);
      } else {
        actualUrl = _calculateRemoteInstanceAbsoluteUrl(
          instanceLocationBloc,
          actualUrl,
        );
      }
    }

    var hashtagName = extractHashtagFromTagUrlIfExist(actualUrl);

    if (hashtagName != null) {
      var hashtag = Hashtag(
        name: hashtagName,
        url: actualUrl,
        history: null,
      );
      if (isLocal) {
        // status or account note with hashtag fetched from local instance

        var uri = Uri.parse(actualUrl);

        var urlHost = uri.host;

        var currentUnifediApiAccessBloc = ICurrentUnifediApiAccessBloc.of(
          context,
          listen: false,
        );
        var localInstanceDomain =
            currentUnifediApiAccessBloc.currentInstance!.urlHost;

        if (localInstanceDomain != urlHost) {
          return showHashtagPageChooserDialog(
            context: context,
            remoteInstanceUri: uri,
            hashtag: hashtag,
          );
        } else {
          return goToLocalHashtagPage(
            context: context,
            hashtag: hashtag,
            myAccountFeaturedHashtag: null,
          );
        }
      } else {
        // status or account note with hashtag fetched from remote instance

        return showHashtagPageChooserDialog(
          context: context,
          remoteInstanceUri: instanceLocationBloc.remoteInstanceUriOrNull!,
          hashtag: hashtag,
        );
      }
    }

    return handleUrlClick(
      context: context,
      url: actualUrl,
    );
  }

  static String _calculateRemoteInstanceAbsoluteUrl(
    IInstanceLocationBloc instanceLocationBloc,
    String url,
  ) {
    var remoteInstanceUriOrNull = instanceLocationBloc.remoteInstanceUriOrNull!;

    var urlHost = remoteInstanceUriOrNull.host;
    var urlSchema = remoteInstanceUriOrNull.scheme;

    return '$urlSchema://$urlHost$url';
  }

  static String _calculateLocalInstanceAbsoluteUrl(
    BuildContext context,
    String url,
  ) {
    var currentUnifediApiAccessBloc =
        ICurrentUnifediApiAccessBloc.of(context, listen: false);

    var urlHost = currentUnifediApiAccessBloc.currentInstance!.urlHost;
    var urlSchema = currentUnifediApiAccessBloc.currentInstance!.urlSchema;

    return '$urlSchema://$urlHost$url';
  }

  static Future<void> handleUrlClickOnLocalInstanceLocation({
    required BuildContext context,
    required String url,
  }) async {
    var uri = Uri.parse(url);

    var host = uri.host;

    var actualUrl = url;

    // check relative links
    if (host.isEmpty) {
      actualUrl = _calculateLocalInstanceAbsoluteUrl(context, actualUrl);
    }

    return handleUrlClick(
      context: context,
      url: actualUrl,
    );
  }

  static Future<void> handleUrlClick({
    required BuildContext context,
    required String url,
  }) async {
    var isCanLaunch = await canLaunch(url);
    _logger.finest(() => 'handleUrlClick isCanLaunch $isCanLaunch $url');
    if (isCanLaunch) {
      var launched = await launch(url);
      _logger.finest(() => 'handleUrlClick launched $launched $url');
    } else {
      await FediSimpleAlertDialog(
        title: S.of(context).link_error_dialog_title,
        contentText: S.of(context).link_error_dialog_content(url),
      ).show<void>(context);
    }
  }

  static String extractUrl(String value) {
    // TODO: rework url regex
    var string = value.replaceAll(RegExp('</a>'), '');

    return string.replaceAll(RegExp('<a[^>]*>'), '');
  }
}
