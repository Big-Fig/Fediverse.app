import 'package:fedi/app/push/fedi_push_notification_model_mock_helper.dart';
import 'package:fedi/app/push/notification/handler/notifications_push_handler_model.dart';
import '../../../../push/push_model_test_helper.dart';

// ignore_for_file: no-magic-number
class PushHandlerModelMockHelper {
  static NotificationsPushHandlerMessage createTestPushHandlerMessage({
    required String seed,
  }) =>
      NotificationsPushHandlerMessage(
        pushMessage: PushModelMockHelper.createTestPushMessage(
          seed: seed,
        ),
        body: FediPushNotificationMockHelper.generate(
          seed: seed,
        ),
      );
}
