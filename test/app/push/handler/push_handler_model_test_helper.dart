import 'package:fedi/app/push/handler/push_handler_model.dart';

import '../../../pleroma/api/push/pleroma_api_push_test_helper.dart';
import '../push_model_test_helper.dart';

// ignore_for_file: no-magic-number
class PushHandlerModelTestHelper {
  static PushHandlerMessage createTestPushHandlerMessage({
    required String seed,
  }) =>
      PushHandlerMessage(
        pushMessage: PushModelTestHelper.createTestPushMessage(
          seed: seed,
        ),
        body: PleromaApiPushTestHelper.createTestPleromaApiPushMessageBody(
          seed: seed,
        ),
      );
}
