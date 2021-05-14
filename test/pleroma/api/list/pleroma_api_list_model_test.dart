import 'package:fedi/pleroma/api/list/pleroma_api_list_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../hive/hive_test_helper.dart';
import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';
import 'pleroma_api_list_test_helper.dart';

// ignore_for_file: no-magic-number
void main() {
  test('PleromaApiList toPleromaApiList', () async {
    var original = PleromaApiListTestHelper.createTestPleromaApiList(
      seed: "seed",
    );
    var obj = original.toPleromaApiList(forceNewObject: true);

    expect(original, obj);
  });

  test('PleromaApiList equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiListTestHelper.createTestPleromaApiList(
        seed: seed,
      ),
    );
  });

  test('PleromaApiList toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiListTestHelper.createTestPleromaApiList(
        seed: seed,
      ),
      PleromaApiList.fromJson,
    );
  });
  test('PleromaApiList hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      ({
        required String seed,
      }) =>
          PleromaApiListTestHelper.createTestPleromaApiList(
        seed: seed,
      ),
    );
  });

  test(
    'PleromaApiMyAccountPleromaPartNotificationsSettingsAdapter hive adapter',
    () async {
      HiveTestHelper.testAdapter(() => PleromaApiListAdapter());
    },
  );
}
