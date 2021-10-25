import 'package:fediverse_api_test_utils/fediverse_api_test_utils.dart';
import 'package:pleroma_api/src/api/status/context/pleroma_api_status_context_model_impl.dart';
import 'package:pleroma_api/src/api/status/context/pleroma_api_status_context_model_impl_mock_helper.dart';
import 'package:test/test.dart';

void main() {
  test(
    'PleromaApiStatusContext equal & hashcode & toString',
    () async {
      ObjTestHelper.testEqualsHashcodeToString(
        PleromaApiStatusContextMockHelper.generate,
      );
    },
  );

  test('PleromaApiStatusContext toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      PleromaApiStatusContextMockHelper.generate,
      (json) => PleromaApiStatusContext.fromJson(json),
    );
  });
}
