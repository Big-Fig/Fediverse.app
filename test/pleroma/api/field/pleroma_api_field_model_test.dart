import 'package:fedi/pleroma/api/field/pleroma_api_field_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';
import 'pleroma_api_field_test_helper.dart';

// ignore_for_file: no-magic-number
void main() {
  test('PleromaApiField equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiFieldTestHelper.createTestPleromaApiField(
        seed: seed,
      ),
    );
  });

  test('PleromaApiField toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiFieldTestHelper.createTestPleromaApiField(
        seed: seed,
      ),
      PleromaApiField.fromJson,
    );
  });
}
