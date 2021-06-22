import 'package:fedi/app/push/notification/handler/unhandled/notifications_push_handler_unhandled_model.dart';

import '../notifications_push_handler_model_test_helper.dart';

// ignore_for_file: no-magic-number
class NotificationsPushHandlerUnhandledModelTestHelper {
  static NotificationsPushHandlerUnhandledList
      createTestPushHandlerUnhandledList({
    required String seed,
  }) =>
          NotificationsPushHandlerUnhandledList(
            messages: [
              PushHandlerModelTestHelper.createTestPushHandlerMessage(
                seed: seed + '1',
              ),
              PushHandlerModelTestHelper.createTestPushHandlerMessage(
                seed: seed + '2',
              ),
            ],
          );
}
