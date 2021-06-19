import 'package:fedi/app/push/notification/simple/handler/unhandled/simple_notifications_push_handler_unhandled_model.dart';

import '../simple_notifications_push_handler_model_test_helper.dart';

// ignore_for_file: no-magic-number
class SimpleNotificationsPushHandlerUnhandledModelTestHelper {
  static SimpleNotificationsPushHandlerUnhandledList createTestPushHandlerUnhandledList({
    required String seed,
  }) =>
      SimpleNotificationsPushHandlerUnhandledList(
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
