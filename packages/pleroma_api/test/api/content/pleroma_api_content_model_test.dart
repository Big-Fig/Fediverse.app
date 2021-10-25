import 'package:fediverse_api_test_utils/fediverse_api_test_utils.dart';
import 'package:pleroma_api/src/api/content/variants/pleroma_api_content_variants_model_impl.dart';
import 'package:pleroma_api/src/api/content/variants/pleroma_api_content_variants_model_impl_mock_helper.dart';
import 'package:test/test.dart';

// ignore_for_file: no-magic-number
void main() {
  test('PleromaApiContentVariants equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      PleromaApiContentVariantsMockHelper.generate,
    );
  });

  test('PleromaApiContentVariants toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      PleromaApiContentVariantsMockHelper.generate,
      (json) => PleromaApiContentVariants.fromJson(json),
    );
  });
}
