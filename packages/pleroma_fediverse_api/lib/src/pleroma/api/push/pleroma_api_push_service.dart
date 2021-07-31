import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/push/pleroma_api_push_model.dart';

abstract class IPleromaApiPushService extends IPleromaApi {
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
