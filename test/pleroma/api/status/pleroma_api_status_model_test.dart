import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';
import 'pleroma_api_status_test_helper.dart';

void main() {
  test('PleromaApiStatus toPleromaApiStatus', () async {
    var original = PleromaApiStatusTestHelper.createTestPleromaApiStatus(
      seed: "seed",
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
