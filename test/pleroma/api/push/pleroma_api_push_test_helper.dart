// ignore_for_file: no-magic-number
import 'package:fedi/pleroma/api/push/pleroma_api_push_model.dart';

// ignore_for_file: no-equal-arguments

class PleromaApiPushTestHelper {
  static PleromaApiPushMessageBody createTestPleromaApiPushMessageBody({
    required String seed,
  }) =>
      PleromaApiPushMessageBody(
        notificationId: seed + 'notificationId',
        server: seed + 'server',
        account: seed + 'account',
        notificationType: seed + 'notificationType',
      );

  static PleromaApiPushSubscribeRequestDataAlerts
      createTestPleromaApiPushSubscribeRequestDataAlerts({
    required String seed,
  }) =>
          PleromaApiPushSubscribeRequestDataAlerts(
            favourite: seed.hashCode % 2 == 0,
            follow: seed.hashCode % 2 == 1,
            mention: seed.hashCode % 2 == 0,
            reblog: seed.hashCode % 2 == 1,
            poll: seed.hashCode % 2 == 0,
            pleromaChatMention: seed.hashCode % 2 == 1,
            pleromaEmojiReaction: seed.hashCode % 2 == 0,
          );

  static PleromaApiPushSubscribeData createTestPleromaApiPushSubscribeData({
    required String seed,
  }) =>
      PleromaApiPushSubscribeData(
        alerts: createTestPleromaApiPushSubscribeRequestDataAlerts(
          seed: seed,
        ),
      );

  static PleromaApiPushSubscriptionKeys
      createTestPleromaApiPushSubscriptionKeys({
    required String seed,
  }) =>
          PleromaApiPushSubscriptionKeys(
            p256dh: seed + 'p256dh',
            auth: seed + 'auth',
          );

  static PleromaApiPushSubscribeRequestSubscription
      createTestPleromaApiPushSubscribeRequestSubscription({
    required String seed,
  }) =>
          PleromaApiPushSubscribeRequestSubscription(
            endpoint: seed + 'endpoint',
            keys: createTestPleromaApiPushSubscriptionKeys(seed: seed),
          );

  static PleromaApiPushSubscribeRequest
      createTestPleromaApiPushSubscribeRequest({
    required String seed,
  }) =>
          PleromaApiPushSubscribeRequest(
            data: createTestPleromaApiPushSubscribeData(
              seed: seed,
            ),
            subscription: createTestPleromaApiPushSubscribeRequestSubscription(
              seed: seed,
            ),
          );
}
