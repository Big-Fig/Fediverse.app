import 'dart:io';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/push/relay/push_relay_service.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;

var urlPath = path.posix;

var _logger = Logger('push_relay_service_impl.dart');

class PushRelayService extends DisposableOwner implements IPushRelayService {
  @override
  final String pushRelayBaseUrl;

  PushRelayService({
    required this.pushRelayBaseUrl,
  });

  @override
  String createPushRelayEndPointUrl({
    required String? account,
    required Uri baseServerUrl,
    required String fcmDeviceToken,
  }) {
    _logger.finest('createPushRelayEndPointUrl start \n'
        '\t account=$account'
        '\t webPushSubscriptionUrl=$baseServerUrl'
        '\t accessToken=$fcmDeviceToken');

    var host = baseServerUrl.host;

    var endpoint = urlPath.join(
      pushRelayBaseUrl,
      '$fcmDeviceToken'
      '?account=$account'
      '&server=$host',
    );

    if (Platform.isIOS) {
      endpoint += '&device=iOS';
      // ignore: no-empty-block
    } else if (Platform.isAndroid) {
//      endpoint += '&device=android';
      // nothing
    } else {
      throw 'Unsupported platform ${Platform.operatingSystem}';
    }
    _logger.finest('createPushRelayEndPointUrl endpoint=$endpoint');

    return endpoint;
  }
}
