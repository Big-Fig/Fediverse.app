import 'package:fedi/push/push_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../app/push/push_model_test_helper.dart';
import '../hive/hive_test_helper.dart';
import '../json/json_test_helper.dart';

// ignore_for_file: no-magic-number
void main() {
  test('PushMessageType toJsonValue & fromJsonValue', () async {
    var values = PushMessageType.values;
    for (final value in values) {
      var jsonValue = value.toJsonValue();

      var objFromJsonValue = jsonValue.toPushMessageType();

      expect(value, objFromJsonValue);
    }
  });

  test('PushMessage toJson & fromJson', () async {
    JsonMockHelper.testFromJsonToJson(
      PushModelMockHelper.createTestPushMessage,
      (json) => PushMessage.fromJson(json),
    );
  });

  test('UnifediApiPostFilter copyWith', () async {
    var obj1 = PushModelMockHelper.createTestPushMessage(
      seed: 'seed1',
    );
    var obj2 = PushModelMockHelper.createTestPushMessage(
      seed: 'seed2',
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
    JsonMockHelper.testFromJsonToJson(
      PushModelMockHelper.createTestPushNotification,
      (json) => PushNotification.fromJson(json),
    );
  });

  test('PushMessage hive save&load', () async {
    await HiveMockHelper.testHiveSaveAndLoad(
      PushModelMockHelper.createTestPushMessage,
    );
  });

  test('PushMessage hive adapter', () async {
    HiveMockHelper.testAdapter(
      () => PushMessageAdapter(),
    );
  });

  test('PushNotificationAdapter hive adapter', () async {
    HiveMockHelper.testAdapter(
      () => PushNotificationAdapter(),
    );
  });
}
