import 'dart:io';


import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/push/relay/push_relay_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;

var urlPath = path.posix;

var _logger = Logger("push_relay_service_impl.dart");

class PushRelayService extends DisposableOwner implements IPushRelayService {
  final String pushRelayBaseUrl;

  PushRelayService({@required this.pushRelayBaseUrl});

  String createPushRelayEndPointUrl({
    @required String account,
    @required String baseServerUrl,
    @required String fcmToken,
  }) {
    _logger.finest("createPushRelayEndPointUrl start \n"
        "\t account=$account"
        "\t webPushSubscriptionUrl=$baseServerUrl"
        "\t accessToken=$fcmToken");

    // remove protocol if exist
    String baseUrl =
        baseServerUrl.replaceAll("https://", "").replaceAll("http://", "");

    String endpoint = urlPath.join(
        pushRelayBaseUrl,
        "$fcmToken"
        "?account=$account"
        "&server=$baseUrl");

    if (Platform.isIOS) {
      endpoint += "&device=iOS";
    } else if (Platform.isAndroid) {
      // nothing
    } else {
      throw "Unsupported platform ${Platform.operatingSystem}";
    }
    _logger.finest("createPushRelayEndPointUrl endpoint=$endpoint");
    return endpoint;
  }
}
