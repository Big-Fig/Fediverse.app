import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPushRelayService {
  static IPushRelayService of(BuildContext context,
      {listen: true}) =>
      Provider.of<IPushRelayService>(context, listen: listen);

  /// Create Url to forward WebPushSubscription to FCM
  String createPushRelayEndPointUrl({
    @required String account,
    @required String baseServerUrl,
    @required String fcmToken,
  });

}