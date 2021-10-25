// ignore_for_file: no-magic-number

import 'mastodon_api_push_payload_model_impl.dart';

// ignore_for_file: no-equal-arguments

class MastodonApiPushPayloadMockHelper {
  static MastodonApiPushPayload generate({
    required String seed,
  }) =>
      MastodonApiPushPayload(
        notificationId: seed + 'notificationId',
        notificationType: seed + 'notificationType',
        body: seed + 'body',
        icon: seed + 'icon',
        title: seed + 'title',
      );
}
