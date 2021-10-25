// ignore_for_file: no-magic-number
import 'pleroma_api_push_payload_model_impl.dart';

// ignore_for_file: no-equal-arguments

class PleromaApiPushPayloadMockHelper {
  static PleromaApiPushPayload generate({
    required String seed,
  }) =>
      PleromaApiPushPayload(
        notificationId: seed + 'notificationId',
        notificationType: seed + 'notificationType',
        body: seed + 'body',
        icon: seed + 'icon',
        title: seed + 'title',
      );
}
