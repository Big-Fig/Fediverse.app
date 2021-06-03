import 'package:fedi/push/push_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../app/push/push_model_test_helper.dart';
import '../hive/hive_test_helper.dart';
import '../json/json_test_helper.dart';

// ignore_for_file: no-magic-number
void main() {
  test('PushMessageType toJsonValue & fromJsonValue', () async {
    var values = PushMessageType.values;
    for (var value in values) {
      var jsonValue = value.toJsonValue();

      var objFromJsonValue = jsonValue.toPushMessageType();

      expect(value, objFromJsonValue);
    }
  });

  test('PushMessage toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) => PushModelTestHelper.createTestPushMessage(
        seed: seed,
      ),
      PushMessage.fromJson,
    );
  });

  test('PostPleromaApiFilter copyWith', () async {
    var obj1 = PushModelTestHelper.createTestPushMessage(
      seed: "seed1",
    );
    var obj2 = PushModelTestHelper.createTestPushMessage(
      seed: "seed2",
    );

    var obj2Obj1CopyWith = obj1.copyWith(
      notification: obj2.notification,
      data: obj2.data,
      typeString: obj2.typeString,
    );

    expect(obj1 == obj2, false);
    expect(obj2, obj2Obj1CopyWith);
    expect(obj1, obj1.copyWith());
  });


  test('PushNotification toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PushModelTestHelper.createTestPushNotification(
        seed: seed,
      ),
      PushNotification.fromJson,
    );
  });

  test('PushMessage hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      ({required String seed}) => PushModelTestHelper.createTestPushMessage(
        seed: seed,
      ),
    );
  });

  test('PushMessage hive adapter', () async {
    HiveTestHelper.testAdapter(
      () => PushMessageAdapter(),
    );
  });

  test('PushNotificationAdapter hive adapter', () async {
    HiveTestHelper.testAdapter(
      () => PushNotificationAdapter(),
    );
  });
}
