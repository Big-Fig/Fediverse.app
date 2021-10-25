import 'package:fediverse_api_test_utils/fediverse_api_test_utils.dart';
import 'package:pleroma_api/src/api/push/payload/pleroma_api_push_payload_model_impl.dart';
import 'package:pleroma_api/src/api/push/payload/pleroma_api_push_payload_model_impl_mock_helper.dart';
import 'package:test/test.dart';

// ignore_for_file: no-magic-number
void main() {
  test(
    'PleromaApiPushPayload equal & hashcode & toString',
    () async {
      ObjTestHelper.testEqualsHashcodeToString(
        PleromaApiPushPayloadMockHelper.generate,
      );
    },
  );

  test('PleromaApiPushPayload toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      PleromaApiPushPayloadMockHelper.generate,
      (json) => PleromaApiPushPayload.fromJson(json),
    );
  });
}
