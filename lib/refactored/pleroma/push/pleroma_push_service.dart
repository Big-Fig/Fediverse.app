
import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/refactored/pleroma/push/pleroma_push_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaPushService extends IPleromaApi {

  static IPleromaPushService of(BuildContext context,
      {listen: true}) =>
      Provider.of<IPleromaPushService>(context, listen: listen);

  /// Add a Web Push API subscription to receive notifications.
  /// Each access token can have one push subscription.
  /// If you create a new subscription, the old subscription is deleted.
  /// It's based on access token
  /// return success or not
  Future<PleromaPushSubscription> subscribe({
    /// WebPush callback url, on mobile it may be created via PushRelayService
    @required String endpointCallbackUrl,
    @required PleromaPushSubscribeData data,
  });

  Future<PleromaPushSubscription> retrieveCurrentSubscription();



  /// Remove subscription for current access token
  Future<bool> unsubscribe();
}
