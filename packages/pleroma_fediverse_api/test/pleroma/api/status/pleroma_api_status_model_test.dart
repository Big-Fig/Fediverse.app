import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:pleroma_fediverse_api/src/pleroma/test/status/pleroma_api_status_test_helper.dart';
import 'package:test/test.dart';

import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';

void main() {
  test('PleromaApiStatus toPleromaApiStatus', () async {
    var original = PleromaApiStatusTestHelper.createTestPleromaApiStatus(
      seed: 'seed',
    );
    var obj = original.toPleromaApiStatus(forceNewObject: true);

    expect(original, obj);
  });
  test('PleromaApiStatus equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiStatusTestHelper.createTestPleromaApiStatus(
        seed: seed,
      ),
    );
  });

  test('PleromaApiStatus toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiStatusTestHelper.createTestPleromaApiStatus(
        seed: seed,
      ),
      PleromaApiStatus.fromJson,
    );
  });
  test('PleromaApiPostStatus equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiStatusTestHelper.createTestPleromaApiPostStatus(
        seed: seed,
      ),
    );
  });

  test('PleromaApiPostStatus toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiStatusTestHelper.createTestPleromaApiPostStatus(
        seed: seed,
      ),
      PleromaApiPostStatus.fromJson,
    );
  });
  test('PleromaApiScheduleStatus equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiStatusTestHelper.createTestPleromaApiScheduleStatus(
        seed: seed,
      ),
    );
  });

  test('PleromaApiScheduleStatus toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiStatusTestHelper.createTestPleromaApiScheduleStatus(
        seed: seed,
      ),
      PleromaApiScheduleStatus.fromJson,
    );
  });
  test('PleromaApiScheduledStatus equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiStatusTestHelper.createTestPleromaApiScheduledStatus(
        seed: seed,
      ),
    );
  });

  test('PleromaApiScheduledStatus toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiStatusTestHelper.createTestPleromaApiScheduledStatus(
        seed: seed,
      ),
      PleromaApiScheduledStatus.fromJson,
    );
  });
}
