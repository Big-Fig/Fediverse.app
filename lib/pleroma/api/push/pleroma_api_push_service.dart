import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/push/pleroma_api_push_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaApiPushService extends IPleromaApi {
  static IPleromaApiPushService of(BuildContext context, {bool listen = true}) =>
      Provider.of<IPleromaApiPushService>(context, listen: listen);

  /// Add a Web Push API subscription to receive notifications.
  /// Each access token can have one push subscription.
  /// If you create a new subscription, the old subscription is deleted.
  /// It's based on access token
  /// return success or not
  Future<PleromaApiPushSubscription> subscribe({
    required String endpointCallbackUrl,
    required PleromaApiPushSubscribeData data,
  });

  Future<PleromaApiPushSubscription> retrieveCurrentSubscription();

  /// Remove subscription for current access token
  Future unsubscribe();
}
