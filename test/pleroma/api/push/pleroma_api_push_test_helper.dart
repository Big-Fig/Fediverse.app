// ignore_for_file: no-magic-number
import 'package:fedi/pleroma/api/push/pleroma_api_push_model.dart';

class PleromaApiPushTestHelper {
  static PleromaApiPushMessageBody createTestPleromaApiPushMessageBody({
    required String seed,
  }) =>
      PleromaApiPushMessageBody(
        notificationId: seed + "notificationId",
        server: seed + "server",
        account: seed + "account",
        notificationType: seed + "notificationType",
      );
}
