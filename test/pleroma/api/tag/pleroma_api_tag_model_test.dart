import 'package:fedi/pleroma/api/tag/pleroma_api_tag_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';
import 'pleroma_api_tag_test_helper.dart';

// ignore_for_file: no-magic-number
void main() {
  test('PleromaApiTag equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiTagTestHelper.createTestPleromaApiTag(
        seed: seed,
      ),
    );
  });

  test('PleromaApiTag toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiTagTestHelper.createTestPleromaApiTag(
        seed: seed,
      ),
      PleromaApiTag.fromJson,
    );
  });
}
