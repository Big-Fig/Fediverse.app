import 'package:fedi/app/push/notification/handler/unhandled/notifications_push_handler_unhandled_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../hive/hive_test_helper.dart';
import '../../../../../json/json_test_helper.dart';
import '../../../../../obj/obj_test_helper.dart';
import 'notifications_push_handler_unhandled_model_test_helper.dart';

void main() {
  test('equal & hashcode & toString', () async {
    ObjMockHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          NotificationsPushHandlerUnhandledModelMockHelper
              .createTestPushHandlerUnhandledList(
        seed: seed,
      ),
    );
  });

  test('toJson & fromJson', () async {
    JsonMockHelper.testFromJsonToJson(
      ({required String seed}) =>
          NotificationsPushHandlerUnhandledModelMockHelper
              .createTestPushHandlerUnhandledList(
        seed: seed,
      ),
      (json) => NotificationsPushHandlerUnhandledList.fromJson(json),
    );
  });

  test('hive save&load', () async {
    await HiveMockHelper.testHiveSaveAndLoad(
      ({required String seed}) =>
          NotificationsPushHandlerUnhandledModelMockHelper
              .createTestPushHandlerUnhandledList(
        seed: seed,
      ),
    );
  });

  test('hive adapter', () async {
    HiveMockHelper.testAdapter(
      () => NotificationsPushHandlerUnhandledListAdapter(),
    );
  });
}
