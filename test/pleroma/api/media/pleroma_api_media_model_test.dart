import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';
import 'pleroma_api_media_test_helper.dart';

// ignore_for_file: no-magic-number
void main() {
  test('PleromaApiMediaAttachment equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiMediaTestHelper.createTestPleromaApiMediaAttachment(
        seed: seed,
      ),
    );
  });

  test('PleromaApiMediaAttachment toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiMediaTestHelper.createTestPleromaApiMediaAttachment(
        seed: seed,
      ),
      PleromaApiMediaAttachment.fromJson,
    );
  });
}
