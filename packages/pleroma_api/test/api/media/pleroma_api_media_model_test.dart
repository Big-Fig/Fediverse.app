import 'package:fediverse_api_test_utils/fediverse_api_test_utils.dart';
import 'package:pleroma_api/src/api/media/attachment/pleroma_api_media_attachment_model_impl.dart';
import 'package:pleroma_api/src/api/media/attachment/pleroma_api_media_attachment_model_impl_mock_helper.dart';
import 'package:test/test.dart';

// ignore_for_file: no-magic-number
void main() {
  test(
    'PleromaApiMediaAttachment equal & hashcode & toString',
    () async {
      ObjTestHelper.testEqualsHashcodeToString(
        PleromaApiMediaAttachmentMockHelper.generate,
      );
    },
  );

  test('PleromaApiMediaAttachment toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      PleromaApiMediaAttachmentMockHelper.generate,
      (json) => PleromaApiMediaAttachment.fromJson(json),
    );
  });
}
