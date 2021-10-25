import 'package:fediverse_api_test_utils/fediverse_api_test_utils.dart';
import 'package:pleroma_api/src/api/filter/pleroma_api_filter_model_impl.dart';
import 'package:pleroma_api/src/api/filter/pleroma_api_filter_model_impl_mock_helper.dart';
import 'package:test/test.dart';

// ignore_for_file: no-magic-number
void main() {
  test('PleromaApiFilter toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      PleromaApiFilterMockHelper.generate,
      (json) => PleromaApiFilter.fromJson(json),
    );
  });

  test('PleromaApiFilter hive adapter', () async {
    HiveTestHelper.testAdapter(
      () => PleromaApiFilterAdapter(),
    );
  });
}
