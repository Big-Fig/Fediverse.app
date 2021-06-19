import 'package:fedi/app/push/notification/simple/handler/simple_notifications_push_handler_model.dart';

import '../../../../../pleroma/api/push/pleroma_api_push_test_helper.dart';
import '../../../../../push/push_model_test_helper.dart';

// ignore_for_file: no-magic-number
class PushHandlerModelTestHelper {
  static SimpleNotificationsPushHandlerMessage createTestPushHandlerMessage({
    required String seed,
  }) =>
      SimpleNotificationsPushHandlerMessage(
        pushMessage: PushModelTestHelper.createTestPushMessage(
          seed: seed,
        ),
        body: PleromaApiPushTestHelper.createTestPleromaApiPushMessageBody(
          seed: seed,
        ),
      );
}
