import 'package:fedi/app/push/handler/unhandled/push_handler_unhandled_model.dart';

import '../push_handler_model_test_helper.dart';

// ignore_for_file: no-magic-number
class PushHandlerUnhandledModelTestHelper {
  static PushHandlerUnhandledList createTestPushHandlerUnhandledList({
    required String seed,
  }) =>
      PushHandlerUnhandledList(
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
