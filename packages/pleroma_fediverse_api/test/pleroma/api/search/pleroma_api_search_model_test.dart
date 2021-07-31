import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:pleroma_fediverse_api/src/pleroma/test/search/pleroma_api_search_test_helper.dart';
import 'package:test/test.dart';

import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';

// ignore_for_file: no-magic-number
void main() {
  test('PleromaApiSearch equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiSearchTestHelper.createTestPleromaApiSearchResult(
        seed: seed,
      ),
    );
  });

  test('PleromaApiSearch toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiSearchTestHelper.createTestPleromaApiSearchResult(
        seed: seed,
      ),
      PleromaApiSearchResult.fromJson,
    );
  });
}
