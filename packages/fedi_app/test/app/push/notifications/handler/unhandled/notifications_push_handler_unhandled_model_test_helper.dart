import 'package:fedi_app/app/push/notification/handler/unhandled/notifications_push_handler_unhandled_model.dart';

import '../notifications_push_handler_model_test_helper.dart';

// ignore_for_file: no-magic-number
class NotificationsPushHandlerUnhandledModelMockHelper {
  static NotificationsPushHandlerUnhandledList
      createTestPushHandlerUnhandledList({
    required String seed,
  }) =>
          NotificationsPushHandlerUnhandledList(
            messages: [
              PushHandlerModelMockHelper.createTestPushHandlerMessage(
                seed: seed + '1',
              ),
              PushHandlerModelMockHelper.createTestPushHandlerMessage(
                seed: seed + '2',
              ),
            ],
          );
}
