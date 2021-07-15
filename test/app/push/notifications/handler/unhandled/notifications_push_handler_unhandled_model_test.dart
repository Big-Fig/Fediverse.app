import 'package:fedi/app/push/notification/handler/unhandled/notifications_push_handler_unhandled_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../hive/hive_test_helper.dart';
import '../../../../../json/json_test_helper.dart';
import '../../../../../obj/obj_test_helper.dart';
import 'notifications_push_handler_unhandled_model_test_helper.dart';

void main() {
  test('equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          NotificationsPushHandlerUnhandledModelTestHelper
              .createTestPushHandlerUnhandledList(
        seed: seed,
      ),
    );
  });

  test('toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          NotificationsPushHandlerUnhandledModelTestHelper
              .createTestPushHandlerUnhandledList(
        seed: seed,
      ),
      NotificationsPushHandlerUnhandledList.fromJson,
    );
  });

  test('hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      ({required String seed}) =>
          NotificationsPushHandlerUnhandledModelTestHelper
              .createTestPushHandlerUnhandledList(
        seed: seed,
      ),
    );
  });

  test('hive adapter', () async {
    HiveTestHelper.testAdapter(
      () => NotificationsPushHandlerUnhandledListAdapter(),
    );
  });
}
