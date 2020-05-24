import 'dart:io';

import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/push/relay/push_relay_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;

var urlPath = path.posix;

var _logger = Logger("push_relay_service_impl.dart");

class PushRelayService extends DisposableOwner implements IPushRelayService {
  final String pushRelayBaseUrl;

  PushRelayService({@required this.pushRelayBaseUrl});

  @override
  String createPushRelayEndPointUrl({
    @required String account,
    @required Uri baseServerUrl,
    @required String fcmDeviceToken,
  }) {
    _logger.finest("createPushRelayEndPointUrl start \n"
        "\t account=$account"
        "\t webPushSubscriptionUrl=$baseServerUrl"
        "\t accessToken=$fcmDeviceToken");

    String host = baseServerUrl.host;

    String endpoint = urlPath.join(
        pushRelayBaseUrl,
        "$fcmDeviceToken"
        "?account=$account"
        "&server=$host");

    if (Platform.isIOS) {
      endpoint += "&device=iOS";
    } else if (Platform.isAndroid) {
      endpoint += "&device=android";
      // nothing
    } else {
      throw "Unsupported platform ${Platform.operatingSystem}";
    }
    _logger.finest("createPushRelayEndPointUrl endpoint=$endpoint");
    return endpoint;
  }
}
