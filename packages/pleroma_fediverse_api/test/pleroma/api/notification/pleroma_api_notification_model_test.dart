import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:pleroma_fediverse_api/src/pleroma/test/notification/pleroma_api_notification_test_helper.dart';
import 'package:test/test.dart';

import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';

// ignore_for_file: no-magic-number
void main() {
  test('PleromaApiNotificationType toJsonValue & fromJsonValue', () async {
    var values = PleromaApiNotificationType.values;
    for (var value in values) {
      var jsonValue = value.toJsonValue();

      var objFromJsonValue = jsonValue.toPleromaApiNotificationType();

      expect(value, objFromJsonValue);
    }
  });
  test('PleromaApiNotificationType valuesWithoutSelected', () async {
    expect(
      [
        PleromaApiNotificationType.favourite,
        PleromaApiNotificationType.follow,
        PleromaApiNotificationType.reblog,
      ].valuesWithoutSelected(
        [
          PleromaApiNotificationType.reblog,
          PleromaApiNotificationType.follow,
        ],
      ),
      [
        PleromaApiNotificationType.favourite,
      ],
    );
  });

  test('PleromaApiNotification equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiNotificationTestHelper.createTestPleromaApiNotification(
        seed: seed,
      ),
    );
  });

  test('PleromaApiNotification toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiNotificationTestHelper.createTestPleromaApiNotification(
        seed: seed,
      ),
      PleromaApiNotification.fromJson,
    );
  });
}
