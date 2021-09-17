import 'package:fedi/app/push/notification/handler/notifications_push_handler_model.dart';
import 'package:unifedi_api/unifedi_api.dart';

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
        body: UnifediApiPushMockHelper.createTestUnifediApiPushMessageBody(
          seed: seed,
        ),
      );
}
