import 'package:fediverse_api_test_utils/fediverse_api_test_utils.dart';
import 'package:pleroma_api/src/api/notification/pleroma_api_notification_model_impl.dart';
import 'package:pleroma_api/src/api/notification/pleroma_api_notification_model_impl_mock_helper.dart';
import 'package:pleroma_api/src/api/notification/type/pleroma_api_notification_type_sealed.dart';
import 'package:test/test.dart';

// ignore_for_file: no-magic-number
void main() {
  test(
    'PleromaApiNotificationType toJsonValue & fromJsonValue',
    () async {
      var values = PleromaApiNotificationType.values;
      for (final value in values) {
        var jsonValue = value.stringValue;

        var objFromJsonValue = jsonValue.toPleromaApiNotificationType();

        expect(value, objFromJsonValue);
      }
    },
  );
  test('PleromaApiNotificationType valuesWithoutSelected', () async {
    expect(
      const [
        PleromaApiNotificationType.favouriteValue,
        PleromaApiNotificationType.followValue,
        PleromaApiNotificationType.reblogValue,
      ].valuesWithoutSelected(
        const [
          PleromaApiNotificationType.reblogValue,
          PleromaApiNotificationType.followValue,
        ],
      ),
      const [
        PleromaApiNotificationType.favouriteValue,
      ],
    );
  });

  test('PleromaApiNotification equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      PleromaApiNotificationMockHelper.generate,
    );
  });

  test('PleromaApiNotification toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      PleromaApiNotificationMockHelper.generate,
      (json) => PleromaApiNotification.fromJson(json),
    );
  });
}
