import 'package:fedi/pleroma/api/instance/pleroma_api_instance_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';
import 'pleroma_api_instance_test_helper.dart';

// ignore_for_file: no-magic-number
void main() {
  test('PleromaApiInstance toPleromaApiInstance', () async {
    var original = PleromaApiInstanceTestHelper.createTestPleromaApiInstance(
      seed: "seed",
    );
    var obj = original.toPleromaApiInstance(forceNewObject: true);

    expect(original, obj);
  });

  test('PleromaApiInstance equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiInstanceTestHelper.createTestPleromaApiInstance(
        seed: seed,
      ),
    );
  });

  test('PleromaApiInstance toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiInstanceTestHelper.createTestPleromaApiInstance(
        seed: seed,
      ),
      PleromaApiInstance.fromJson,
    );
  });
}
