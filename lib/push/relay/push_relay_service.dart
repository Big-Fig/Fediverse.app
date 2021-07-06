import 'package:easy_dispose/easy_dispose.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPushRelayService extends IDisposable {
  static IPushRelayService of(
    BuildContext context, {
    listen = true,
  }) =>
      Provider.of<IPushRelayService>(
        context,
        listen: listen,
      );

  String get pushRelayBaseUrl;

  /// Create Url to forward WebPushSubscription to FCM
  String createPushRelayEndPointUrl({
    required String? account,
    required Uri baseServerUrl,
    required String fcmDeviceToken,
  });
}
