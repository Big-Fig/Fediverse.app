import 'package:fedi/app/push/notification/handler/notifications_push_handler_model.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';

import '../../../../push/push_model_test_helper.dart';

// ignore_for_file: no-magic-number
class PushHandlerModelTestHelper {
  static NotificationsPushHandlerMessage createTestPushHandlerMessage({
    required String seed,
  }) =>
      NotificationsPushHandlerMessage(
        pushMessage: PushModelTestHelper.createTestPushMessage(
          seed: seed,
        ),
        body: PleromaApiPushTestHelper.createTestPleromaApiPushMessageBody(
          seed: seed,
        ),
      );
}
