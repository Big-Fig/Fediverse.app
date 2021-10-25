import 'package:fediverse_api_test_utils/fediverse_api_test_utils.dart';
import 'package:pleroma_api/src/api/search/pleroma_api_search_model_impl.dart';
import 'package:pleroma_api/src/api/search/pleroma_api_search_model_impl_mock_helper.dart';
import 'package:test/test.dart';

// ignore_for_file: no-magic-number
void main() {
  test('PleromaApiSearch equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      PleromaApiSearchResultMockHelper.generate,
    );
  });

  test('PleromaApiSearch toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      PleromaApiSearchResultMockHelper.generate,
      (json) => PleromaApiSearchResult.fromJson(json),
    );
  });
}
