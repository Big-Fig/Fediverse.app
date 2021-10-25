// ignore_for_file: no-magic-number
import 'unifedi_api_push_payload_model_impl.dart';

// ignore_for_file: no-equal-arguments

class UnifediApiPushPayloadMockHelper {
  static UnifediApiPushPayload generate({
    required String seed,
  }) =>
      UnifediApiPushPayload(
        notificationId: seed + 'notificationId',
        notificationType: seed + 'notificationType',
        body: seed + 'body',
        icon: seed + 'icon',
        title: seed + 'title',
      );
}
