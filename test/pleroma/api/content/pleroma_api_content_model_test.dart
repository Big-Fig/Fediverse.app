import 'package:fedi/pleroma/api/content/pleroma_api_content_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';
import 'pleroma_api_content_test_helper.dart';

// ignore_for_file: no-magic-number
void main() {
  test('PleromaApiContent equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiContentTestHelper.createTestPleromaApiContent(
        seed: seed,
      ),
    );
  });

  test('PleromaApiContent toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiContentTestHelper.createTestPleromaApiContent(
        seed: seed,
      ),
      PleromaApiContent.fromJson,
    );
  });
}
