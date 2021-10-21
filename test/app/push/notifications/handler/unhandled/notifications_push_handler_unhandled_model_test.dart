import 'package:fedi/app/push/notification/handler/unhandled/notifications_push_handler_unhandled_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../hive/hive_test_helper.dart';
import '../../../../../json/json_test_helper.dart';
import '../../../../../obj/obj_test_helper.dart';
import 'notifications_push_handler_unhandled_model_test_helper.dart';

// ignore_for_file: avoid-ignoring-return-values
void main() {
  test('equal & hashcode & toString', () async {
    ObjMockHelper.testEqualsHashcodeToString(
      NotificationsPushHandlerUnhandledModelMockHelper
          .createTestPushHandlerUnhandledList,
    );
  });

  test('toJson & fromJson', () async {
    JsonMockHelper.testFromJsonToJson(
      NotificationsPushHandlerUnhandledModelMockHelper
          .createTestPushHandlerUnhandledList,
      (json) => NotificationsPushHandlerUnhandledList.fromJson(json),
    );
  });

  test('hive save&load', () async {
    await HiveMockHelper.testHiveSaveAndLoad(
      NotificationsPushHandlerUnhandledModelMockHelper
          .createTestPushHandlerUnhandledList,
    );
  });

  test('hive adapter', () async {
    HiveMockHelper.testAdapter(
      () => NotificationsPushHandlerUnhandledListAdapter(),
    );
  });
}
